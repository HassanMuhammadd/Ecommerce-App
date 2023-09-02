import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projects/theme.dart';
import 'package:provider/provider.dart';


class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key,required this.userEmail,required this.userName});
  final String? userEmail;
  final String? userName;
  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                //   color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),

                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${widget.userName}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.userEmail}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Container(
                      width: 170,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromRGBO(22, 153, 81, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(

                            'Edit Profile',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,


                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Preferences',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
                // fontWeight: FontWeight.bold

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //color: Colors.white,
              width: double.infinity,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        // color: Colors.grey[800],
                        size: 30,
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    ],
                  ),

                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            Container(
              //   color: Colors.white,
              width: double.infinity,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Icon(
                        Icons.dark_mode_outlined,
                        //color: Colors.grey[800],
                        size: 30,
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                    ],
                  ),
                  Center(
                    child: Consumer<ThemeProvider>(
                        builder: (context, themeProvider, _) {
                          return IconButton(
                              icon: themeProvider.isDarkMode
                                  ? FaIcon(FontAwesomeIcons.toggleOn)
                                  : FaIcon(FontAwesomeIcons.toggleOff),
                              onPressed: () {
                                setState(() {

                                  themeProvider.toggleTheme();
                                  final snackBar = SnackBar(
                                    content: Text(
                                      themeProvider.isDarkMode
                                          ? 'Switched to Dark Mode'
                                          : 'Switched to Light Mode',
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar);
                                },
                                );
                              });
                        }
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Icon(
                        Icons.credit_card_outlined,
                        //    color: Colors.grey[800],
                        size: 30,
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    ],
                  ),

                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        //color: Colors.grey[800],
                        size: 30,
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Help and Feedback',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    ],
                  ),

                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),




          ],
        ),
      ) ,
    );
  }
}