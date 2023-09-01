import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  AccountDetails({super.key, required this.userName,required this.userEmail});
  final String? userName;
  final String? userEmail;
  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {

  late String? userName = widget.userName;
  late String? userEmail = widget.userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            height:250,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(22, 153, 81, 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35))
            ),
            child:  Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  radius: 30,
                ),
                SizedBox(width:20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${userName}",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height:10),
                    Text("${userEmail}",style: TextStyle(fontSize: 16,color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height:40),
          Container(

            padding: const EdgeInsets.all(25),
             child: const Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
                  Icon(Icons.arrow_forward_ios_sharp),
               ],
             ),
          ),
              Container(alignment: Alignment.center,padding: const EdgeInsets.all(25),height:1,color: Colors.black12,width: double.infinity,),
          Container(

            padding: const EdgeInsets.all(25),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
                Icon(Icons.arrow_forward_ios_sharp),
              ],
            ),
          ),
          Container(alignment: Alignment.center,padding: const EdgeInsets.all(25),height:1,color: Colors.black12,width: double.infinity,),
          Container(

            padding: const EdgeInsets.all(25),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
                Icon(Icons.arrow_forward_ios_sharp),
              ],
            ),
          ),
          Container(alignment: Alignment.center,padding: const EdgeInsets.all(25),height:1,color: Colors.black12,width: double.infinity,),
          Container(

            padding: const EdgeInsets.all(25),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
                Icon(Icons.arrow_forward_ios_sharp),
              ],
            ),
          ),
          Container(alignment: Alignment.center,padding: const EdgeInsets.all(25),height:1,color: Colors.black12,width: double.infinity,)
        ],
      ),
    );
  }
}
