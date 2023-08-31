import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkry = GlobalKey<FormState>();
  bool obsecure = true;
  bool? checked = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkry,
          child: Center(
            child: Container(
              // color: Colors.green,
              height: height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   height: height / 10,
                  // ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/online-shopping-icon-vector-design-e-commerce-shopping-symbol-web-graphic-jpg-ai-app-logo-object-flat-image-sign-eps-art-picture-80243527.webp'),
                  ),
                  // SizedBox(
                  //   height: height / 17,
                  // ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: width / 15, fontWeight: FontWeight.normal),
                  ),
                  // SizedBox(
                  //   height: height / 40,
                  // ),
                  SizedBox(
                    width: width * 0.85,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height / 40),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                        ),
                        labelText: "Name",
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: height / 40,
                  // ),
                  SizedBox(
                    width: width * 0.85,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (value!.length <= 6) {
                          return "Password must be more than 6 characters";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height / 40),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey[600],
                        ),
                        labelText: "password",
                        suffixIcon: IconButton(
                          icon: Icon(obsecure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                        ),
                      ),
                      obscureText: obsecure,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(
                        // width: width / 40,
                        // ),
                        Checkbox(
                          value: checked,
                          onChanged: (bool? newval) {
                            checked = newval;
                          },
                          activeColor: Colors.black,
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: height/20,),
                  // SizedBox(
                  //   height: height / 40,
                  // ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minimumSize: Size(250, 50)),
                      onPressed: () {
                        if (formkry.currentState!.validate()) {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                        }
                      },
                      child:
                          Text("LOGIN", style: TextStyle(color: Colors.white))),
                  Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        child: Text("Or",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ),                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () {
                               /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));*/
                              },
                              child: Text(
                                "Sign-up",
                              )),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
