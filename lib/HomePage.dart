import 'package:flutter/material.dart';
import 'package:projects/MainPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int currentIdx = 0;
  List<Widget>Widgets = [
    MainPage()
    ,
    Container(
        child:Center(
          child:Text("Offers",style: TextStyle(fontSize: 50,),),
        )
    ),
    Container(
        child:Center(
          child:Text("Call",style: TextStyle(fontSize: 50,),),
        )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 80,

        leading: Row(
          children:[
            SizedBox(width:20),
           CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
              radius: 30,
          ),
          ]
        ),
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello",style: TextStyle(color:Color.fromRGBO(0, 0, 0, 0.6),fontSize: 14),),
            Text("Hassan Muhammad",style: TextStyle(color:Colors.black),),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        currentIndex: currentIdx,
        onTap: (index){
          setState(() {
            currentIdx = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer),label: "Offers"),
          BottomNavigationBarItem(icon: Icon(Icons.call),label: "Call"),
        ],
      ),
      body:Widgets.elementAt(currentIdx),
    );
  }
}

