import 'dart:convert';
import 'package:ars_progress_dialog/dialog.dart';
import 'package:cocheskm/api/api_service.dart';
import 'package:cocheskm/model/province_response.dart';
import 'package:cocheskm/utils/ProgressDialogUtil.dart';
import 'package:cocheskm/utils/colors.dart';
import 'package:cocheskm/widgets/Decoration.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'fifthPage.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyFourthPage(),
    );
  }
}

class MyFourthPage extends StatefulWidget {
  @override
  _MyFourthPageState createState() => _MyFourthPageState();
}

class _MyFourthPageState extends State<MyFourthPage> {
  var isApiCallProcess;
  ProvincesResponseModel selectedProvince;
  ArsProgressDialog _progressDialogUtil;
  List<ProvincesResponseModel> provinceResponse;

  @override
  void initState() {
    super.initState();
    isApiCallProcess = false;
    _progressDialogUtil = ProgressDialogUtil.arcProgressDialog(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllProvinces();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      "Información personal",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                    ),
                    Form(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  // left: 8.0,
                                  top: 20.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "Nombre completo",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _controller,
                                cursorHeight: 30.0,
                                style: TextStyle(height: 0.8),
                                decoration: InputDecoration(
                                  // suffixIcon: PopupMenuButton<String>(
                                  //   icon: const Icon(Icons.expand_more),
                                  //   onSelected: (String value) {
                                  //     _controller.text = value;
                                  //   },
                                  //   itemBuilder: (BuildContext context) {
                                  //     return items.map<PopupMenuItem<String>>(
                                  //             (String value) {
                                  //           return new PopupMenuItem(
                                  //               child: new Text(value),
                                  //               value: value);
                                  //         }).toList();
                                  //   },
                                  // ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10.0, -1, 10.0, 0),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: PrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
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
                                  "Número de Móvil",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                // style: TextStyle(height: 0.8),
                                decoration: inputDecoration(),
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
                                  "Provincia",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Container(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: PrimaryColor,
                                        style: BorderStyle.solid,
                                        width: 0.80),
                                  ),

                                  child: DropdownButton<ProvincesResponseModel>(
                                    isExpanded: true,
                                    hint: Text("Select item"),
                                    underline: SizedBox(),
                                    value: selectedProvince,
                                    onChanged: (ProvincesResponseModel value) {
                                      setState(() {
                                        selectedProvince = value;
                                      });
                                    },
                                    items: provinceResponse?.map(
                                        (ProvincesResponseModel province) {
                                      return DropdownMenuItem<
                                          ProvincesResponseModel>(
                                        value: province,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              province.texto,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      );
                                    })?.toList(),
                                  ),
                                ),
                              ),
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
                                  "Población",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _controller,
                                cursorHeight: 30.0,
                                // style: TextStyle(height: 0.8),
                                decoration: InputDecoration(
                                  // suffixIcon: PopupMenuButton<String>(
                                  //   icon: const Icon(Icons.expand_more),
                                  //   onSelected: (String value) {
                                  //     _controller.text = value;
                                  //   },
                                  //   itemBuilder: (BuildContext context) {
                                  //     return items.map<PopupMenuItem<String>>(
                                  //         (String value) {
                                  //       return new PopupMenuItem(
                                  //           child: new Text(value),
                                  //           value: value);
                                  //     }).toList();
                                  //   },
                                  // ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10.0, -1, 10.0, 0),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(color: PrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
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
                                        builder: (context) => FifthPage()),
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
                          position: 0,
                          decorator: DotsDecorator(
                            size: const Size.square(8.0),
                            activeSize: const Size(8.0, 8.0),
                            spacing: const EdgeInsets.all(8.0),
                            color: Color(0xFFEEEAEA),
                            // Inactive color
                            activeColor: Color(0xFF1AB394),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void getAllProvinces() {
    setState(() {
      isApiCallProcess = true;
      _progressDialogUtil.show();
    });
    APIService.getAllProvince().then((value) {
      if (value != null) {
        List<ProvincesResponseModel> provinceResponse =
            (json.decode(value) as List)
                .map((data) => ProvincesResponseModel.fromJson(data))
                .toList();
        setState(() {
          isApiCallProcess = false;
          _progressDialogUtil.dismiss();
          this.provinceResponse = provinceResponse;
        });

        print(provinceResponse);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    }).onError((error, stackTrace) {
      setState(() {
        isApiCallProcess = false;
        _progressDialogUtil.dismiss();
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    });
  }
}
