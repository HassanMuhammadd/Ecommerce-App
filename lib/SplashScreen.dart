import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }
  navigateToLogin() async{
    await Future.delayed(Duration(seconds: 1), (){});
    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: Center(child: Text(
        "E-Commerce",
        style: TextStyle(
            fontSize: 70 ,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      )),
    ) ;
  }
/* Widget content(){
    return Container(
      child:,
    ),
  }*/
}