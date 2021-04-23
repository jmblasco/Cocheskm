import 'file:///F:/StudioProjects/cocheskm/lib/pages/login/LoginPage.dart';
import 'package:cocheskm/utils/ColorsConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/header_2.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              //Center Row contents vertically,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Material(
                          color: PrimaryColor, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: ImageIcon(
                                AssetImage('images/attention_icon.png'),
                            color: Colors.white,
                          )),
                            onTap: () {

                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Cómo \nfuncionamos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Material(
                          color: PrimaryColor, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: ImageIcon(
                                  AssetImage('images/tag_icon.png'),
                                  color: Colors.white,
                                )),
                            onTap: () {

                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Vende tu \ncoche",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Material(
                          color: PrimaryColor, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: ImageIcon(
                                  AssetImage('images/user_icon.png'),
                                  color: Colors.white,
                                )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Inicia o \nregistrate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
