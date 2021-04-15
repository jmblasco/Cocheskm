import 'package:cocheskm/pages/thirdPage.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyFifthPage(),
    );
  }
}

class MyFifthPage extends StatefulWidget {
  @override
  _MyFifthPageState createState() => _MyFifthPageState();
}

class _MyFifthPageState extends State<MyFifthPage> {
  var items = ['Selecciona'];

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
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
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/header_2.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      "Información de tu coche",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 15, right: 15),
                          child: Text(
                            "Debes introducir algunos datos tuyos y de tu vehículo, así como fotografías y/o un video, para poder solicitar a los profesionales que realicen una tasación de tu coche con una la máxima información posible",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  // left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "Marca",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              TextField(
                                controller: _controller,
                                cursorHeight: 30.0,
                                // style: TextStyle(height: 0.8),
                                decoration: InputDecoration(
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: const Icon(Icons.expand_more),
                                    onSelected: (String value) {
                                      _controller.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items.map<PopupMenuItem<String>>(
                                          (String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value),
                                            value: value);
                                      }).toList();
                                    },
                                  ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32, right: 32, top: 16, bottom: 16),
                                  child: Text(
                                    "Modelo",
                                    style: TextStyle(
                                      color: Color(0xFF1AB394),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32, right: 32, top: 16, bottom: 16),
                                  child: Text(
                                    "Modelo",
                                    style: TextStyle(
                                      color: Color(0xFF1AB394),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  // left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "Modelo",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              TextField(
                                controller: _controller,
                                cursorHeight: 30.0,
                                // style: TextStyle(height: 0.8),
                                decoration: InputDecoration(
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: const Icon(Icons.expand_more),
                                    onSelected: (String value) {
                                      _controller.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items.map<PopupMenuItem<String>>(
                                          (String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value),
                                            value: value);
                                      }).toList();
                                    },
                                  ),
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
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  // left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "Versión",
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
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  // left: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "Combustible",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              TextField(
                                controller: _controller,
                                cursorHeight: 30.0,
                                // style: TextStyle(height: 0.8),
                                decoration: InputDecoration(
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: const Icon(Icons.expand_more),
                                    onSelected: (String value) {
                                      _controller.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items.map<PopupMenuItem<String>>(
                                          (String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value),
                                            value: value);
                                      }).toList();
                                    },
                                  ),
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
                              left: 40, right: 40, top: 30, bottom: 10),
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
                                  "Siguiente",
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
                        DotsIndicator(
                          dotsCount: 4,
                          position: 1,
                          decorator: DotsDecorator(
                            size: const Size.square(15.0),
                            activeSize: const Size(15.0, 15.0),
                            spacing: const EdgeInsets.all(15.0),
                            color: Color(0xFFEEEAEA), // Inactive color
                            activeColor: Color(0xFF1AB394),
                          ),
                        )
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
