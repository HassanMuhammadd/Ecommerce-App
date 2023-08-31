import 'package:flutter/material.dart';
import 'package:projects/ProductDetails.dart';

import 'DioHelper.dart';
import 'Product.dart';

class ProductsHome extends StatefulWidget {
   ProductsHome({super.key, required this.prods});
  final List<Product> prods;
  @override
  State<ProductsHome> createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  late List<Product> products=widget.prods;
  List<Product> temp=[];
  List<bool> iconFill=  List.filled(30, false, growable : true);
  List<String> categories = List.filled(0, "",growable: true);
  String dropDownVal = "all";

  Future<void>fetchProducts () async {
    //List prods = await DioHelper().getData();
    //products = Product.convertToProduct(prods);
    temp = products;
    //fill the categories list with items
    populateCategories();
    setState(() {});
  }

  void populateCategories(){
    categories.add("all");
    for(var prod in products)
    {
      if(!categories.contains(prod.category))
      {
        categories.add(prod.category);
      }
    }
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      //backgroundColor: Colors.white,
      body: Column(
        children: [

          Center(
            child: Container(
                height: 45,

                width: 350,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],


                ),
                child: Center(
                  child: TextFormField(
                    //     cursorHeight: 20,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      labelText: '          what are you looking for?',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      //          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 117,),
                      border: InputBorder.none,
                      focusColor: Colors.deepOrange,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
            ),
          ),
          const SizedBox(height:10),
          Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                  width:25
              ),
              DropdownButton(
                value: dropDownVal,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Color.fromRGBO(22, 153, 81, 1)
                ),
                iconEnabledColor:Color.fromRGBO(22, 153, 81, 1),
                  items: categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),

                  onChanged: (String? value) {

                  setState(() {
                  dropDownVal = value!;

                  products = temp.where((element) => element.category==dropDownVal || dropDownVal=="all").toList();
                  });
                  },
              ),

            ],
          ),
          Expanded(
            child: GridView.builder(
                itemCount: products.length,
                primary: true,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 15,mainAxisSpacing: 15),
                itemBuilder: (context, index) {

                  return Material(

                    child: InkWell(
                      onTap: (){
                        //on Product Tap
                        Navigator.of(context).push( MaterialPageRoute(builder: (context)=>ProductDetails(prod:products[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(

                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:double.infinity,
                                height:150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:DecorationImage(
                                      image:NetworkImage(products[index].images[0]),
                                    )
                                ),
                                child: Column(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width:35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),

                                      ),
                                      child: IconButton(
                                        //icon:Icon(Icons.favorite_border),
                                        icon: Icon(iconFill[index]==true?Icons.favorite:Icons.favorite_border,color: Colors.red,size: 18,),
                                        onPressed: (){
                                          setState(() {
                                            iconFill[index] = !iconFill[index];
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(products[index].images[0],height: 120,width: double.infinity,fit:BoxFit.fill)
                                  ),*/
                              Text(products[index].title,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                              Text("\$${products[index].price}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w900),textAlign: TextAlign.start,)

                            ],

                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),

    );
  }
}