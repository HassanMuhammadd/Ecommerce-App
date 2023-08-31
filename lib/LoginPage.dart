import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projects/HomePage.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  var passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(255, 255  , 255, 0.95),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [

                    SizedBox(height:200),
                    Image.asset("assets/images/talabatLogo.png",width: 250,),
                    SizedBox(height:60),
                    Text("Sign up for free!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey
                      ),
                    ),
                    SizedBox(height:100),

                    Form(key:formKey,
                      child: Container(
                        width: 250,
                        child: Column(

                          children: [
                              TextFormField(validator: (value){
                                  if(!EmailValidator.validate(value!))
                                    {
                                      return "You must enter a valid email";
                                    }
                              },
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "email",
                                    labelStyle: TextStyle(color: Colors.deepOrange),
                                    prefixIcon: Icon(Icons.person,color: Colors.deepOrange , ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                        width:1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.deepOrange,
                                        width:2,
                                      ),
                                    ),
                                  ),
                              ),
                              SizedBox(height:20),
                              TextFormField(validator: (value){
                                if(value!.length < 6)
                                {
                                  return "Password can't be less than 6 characters.";
                                }
                              },
                                obscureText: passwordVisible,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "Password",

                                  labelStyle: TextStyle(color: Colors.deepOrange),
                                  prefixIcon: Icon(Icons.lock,color: Colors.deepOrange),
                                  suffixIcon: IconButton(
                                    icon: Icon(passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,color: Colors.deepOrange,),
                                    onPressed: () {
                                      setState(
                                            () {
                                          passwordVisible = !passwordVisible;
                                        },
                                      );
                                    },
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                      width:1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                      width:2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height:30),
                              MaterialButton(
                                  onPressed: (){
                                    if(formKey.currentState!.validate())
                                    {
                                      //navigate here
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                        return const Homepage();
                                      }));
                                    }
                                  },
                                  child:Container(
                                      width: 150,
                                      height:50,
                                      decoration: BoxDecoration(
                                        color:Colors.deepOrange,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:Center(
                                          child: Text("Log In",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                      ),
                                  )
                              ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

          ),
        ),
    );
  }
}
