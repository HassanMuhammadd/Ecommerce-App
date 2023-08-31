import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
                child: Container(
                  width: screenWidth*0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:20),
                      Material(
                        color: Colors.white,
                        elevation: 4,
                        borderRadius: BorderRadius.circular(50),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top:10,bottom:15,left:20,right:20),
                            focusedBorder: InputBorder.none,
                            labelText: "   Talabat",
                            labelStyle: TextStyle(color: Color.fromRGBO(255, 0, 0, 0.4)),
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(Icons.search,
                            color: Colors.deepOrange),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                      SizedBox(height:20),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Talabat mart\n20 mins Delivery",
                                  style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text("Get all your groceries",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                  ),
                                ),
                                SizedBox(height: 15),
                                MaterialButton(onPressed: (){},
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text("Order Now!",style: TextStyle(color: Colors.deepOrange),),
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.add_shopping_cart,color: Colors.white,size: 50),
                          ],
                        ),
                      ),
                      SizedBox(height:20),
                      Text("  Categories",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                      SizedBox(height:10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              clipBehavior: Clip.hardEdge,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/pizza.jpeg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),

                             child:Text("Pizza",style: TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              clipBehavior: Clip.hardEdge,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/breakfast.jpeg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child:Text("Breakfast",style: TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              clipBehavior: Clip.hardEdge,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/hotdog.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child:Text("Fast Food",style: TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomLeft,
                              clipBehavior: Clip.hardEdge,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/steak.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child:Text("Steak",style: TextStyle(color:Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height:20),
                      Text("  Offers",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(height:10),
                      Container(
                      //  height:300,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset("assets/images/offer.jpeg"),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
