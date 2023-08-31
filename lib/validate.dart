import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Validate extends StatelessWidget {
   Validate({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(key: formKey,
                 child: Column(
                   children: [

                     Container(

                       width:250,
                       child: TextFormField(validator: (value){

                         if(value!.length < 8)
                           {
                             return "Password must be 8 characters or more";
                           }
                         },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password),
                        ),
                       ),
                     ),
                     SizedBox(height:20),
                     MaterialButton(onPressed: (){
                        if(formKey.currentState!.validate())
                          {
                            //navigate here
                          }
                     },
                     child: Container(
                       width:150,
                       height: 30,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child:Text("Submit",
                         textAlign: TextAlign.center,
                         style: TextStyle(color: Colors.white),
                       ),
                     ),
                     )
                   ],
                 ),
                  ),
              ],
            ),
          ),
    );
  }
}
