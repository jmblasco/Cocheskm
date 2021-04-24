import 'package:cocheskm/pages/login/LoginPage.dart';
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
                  image: AssetImage('images/header_2.png'), fit: BoxFit.cover),
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
                  padding: const EdgeInsets.only(top: 16.0),
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
                            onTap: () {},
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
                  padding: const EdgeInsets.only(top: 16.0),
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
                            onTap: () {},
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
                  padding: const EdgeInsets.only(top: 16.0),
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
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
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
          ),
          Container(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 8)),
                Icon(
                  Icons.expand_less,
                  color: PrimaryColor,
                ),
                Text(
                  "Desliza hacia arriba para leer las últimas noticias",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                    // itemCount: country == null ? 0 : country.length,
                    itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          height: 40,
                          child: new Row(
                            // Stretch the cards in horizontal axis
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 24.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'images/image_list.png'))),
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Flexible(
                                child: Text(
                                  // Read the name field value and set it in the Text widget
                                  "Jaguar Land Rover quiere los coches eléctricos sean más eficientes sin tocar un solo cable",
                                  // set some style to text
                                  overflow: TextOverflow.visible,
                                  style: new TextStyle(
                                      fontSize: 10.0, color: PrimaryColor),
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                })),
          )
        ],
      )),
    );
  }
}
