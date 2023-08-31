import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _name,_email,_password;
  FirebaseAuth instance = FirebaseAuth.instance; //Server auth

  final formkey = GlobalKey<FormState>();
  bool obsecure = true;
  bool? checked = true;

  @override
  void initstate(){
    super.initState();
    instance.authStateChanges().listen((User user) {
      if(user == null){
        //print('no user');
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else{
       // print('there is a user');
      }
    } as void Function(User? event)?);
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              height: height,
              // color: Colors.red,
              child: Center(
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
                          'assets/images/online-shopping-icon-vector-design-e-commerce-shopping-symbol-web-graphic-jpg-ai-app-logo-object-flat-image-sign-eps-art-picture-80243527.webp'),
                    ),
                    // SizedBox(
                    //   height: height / 17,
                    // ),
                    Positioned(
                      top: 220,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w800),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    ),
                    // SizedBox(
                    //   height: height / 40,
                    // ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          validator: (value) {
                            if(!EmailValidator.validate(value!)){
                              return "You must enter a valid email";
                            }
                            if (value!.isEmpty) {
                              return "Please enter your Email";
                            } else {
                              _email = value;
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height / 40),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey[600],
                            ),
                            labelText: "Email",
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: height / 40,
                    // ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            } else if (value!.length <= 6) {
                              return "Password must be more than 6 characters";
                            } else {
                              _password = value;
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
                            labelText: "Password",
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   width: width / 40,
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
                    ),
                    // SizedBox(height: height / 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            minimumSize: Size(250, 50)
                        ),
                        onPressed: (){
                          if (formkey.currentState!.validate()) {
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                          }
                        },
                        child: Text("Create Account",
                            style: TextStyle(color: Colors.white))),
                    Column(
                      children: [
                        Text("Or",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Have an account?"),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerLeft,
                                ),
                                onPressed: () {
                               /*   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ));*/
                                },
                                child: Text("Sign-in",)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}