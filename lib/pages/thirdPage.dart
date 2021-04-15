import 'package:flutter/material.dart';

import 'package:cocheskm/pages/fourthPage.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyThirdPage(),
    );
  }
}

class MyThirdPage extends StatefulWidget {
  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/header_1.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Bienvenido a Coches KM",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w900,
                        wordSpacing: -1,
                        fontSize: 30.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 30, right: 15),
                      child: Text(
                        "Obten varias tasaciones reales de distintos profesiones sin salir de casa, evitando desplazamientos innecesarios, respondiendo las siguientes preguntas.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF1AB394),
                            fontSize: 16.0,
                            height: 1.25),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 50, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FlatButton(
                                height: 55,
                                color: Color(0x331AB394),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FourthPage()),
                                  );
                                },
                                child: Text(
                                  "Comenzar",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
