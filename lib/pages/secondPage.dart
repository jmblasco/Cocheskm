import 'package:cocheskm/pages/thirdPage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MySecondPage(),
    );
  }
}

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    var checkedValue = true;
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
                child: Column(
                  children: [
                    Text(
                      "Verificación de E-mail",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: Text(
                        "Introduzca el código que ha recibido en su e-mail. Si ha recibido más de uno utilice el último recibido. Esta operación únicamente es necesaria la primera vez que accede a su cuenta.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "Codigo",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              TextField(
                                cursorHeight: 30.0,
                                // style: TextStyle(height: 0.8),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10.0, -1, 10.0, 0),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                      color: Color(0xFF1AB394),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 30, bottom: 20),
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
                                        builder: (context) => ThirdPage()),
                                  );
                                },
                                child: Text(
                                  "Validar",
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
                        Padding(
                          padding:
                              EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Text(
                            "Si no tiene código, lo ha borrado o ha caducado el que tiene, solicite uno nuevo.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 1.05,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlatButton(
                                height: 30,
                                color: Color(0x331AB394),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ThirdPage()),
                                  );
                                },
                                child: Text(
                                  "Recibir un código nuevo",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "Volver al inicio.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF1AB394),
                              decoration: TextDecoration.underline,
                              fontSize: 14.0,
                              height: 1.05,
                            ),
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
