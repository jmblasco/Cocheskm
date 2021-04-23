import 'package:cocheskm/pages/register/vehicalRegistraion/RegistroCosioTwo.dart';
import 'package:cocheskm/utils/ColorsConstants.dart';
import 'package:flutter/material.dart';

class RegistroCosioOne extends StatelessWidget {
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
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/header_1.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Bienvenido a Coches KM",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w800,
                        wordSpacing: -1,
                        fontSize: 22.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, top: 10, right: 50),
                      child: Text(
                        "Obten varias tasaciones reales de distintos profesiones sin salir de casa, evitando desplazamientos innecesarios, respondiendo las siguientes preguntas.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF1AB394),
                            fontSize: 12.0,
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
                                        builder: (context) => RegisteroCosioTwo()),
                                  );
                                },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Comenzar",
                                        style: TextStyle(
                                          color: Color(0xFF1AB394),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Padding(padding: EdgeInsets.only(left: 8.0)),
                                      Icon(Icons.arrow_forward_outlined,color: PrimaryColor,)
                                    ],
                                  ),
                                )
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
