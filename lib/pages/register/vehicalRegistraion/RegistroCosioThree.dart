import 'dart:convert';

import 'package:ars_progress_dialog/dialog.dart';
import 'package:cocheskm/api/api_service.dart';
import 'package:cocheskm/model/MarcasResponseModel.dart';
import 'package:cocheskm/pages/register/vehicalRegistraion/RegisteroCosioOne.dart';
import 'package:cocheskm/utils/ProgressDialogUtil.dart';
import 'package:cocheskm/utils/ColorsConstants.dart';
import 'package:cocheskm/widgets/Decoration.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class RegisteroCosioThree extends StatelessWidget {
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

  var isApiCallProcess;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ArsProgressDialog _progressDialogUtil;

  List<Entries> _marcasEntriesList;
  Entries _selectedMarcas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _progressDialogUtil = ProgressDialogUtil.arcProgressDialog(context);
    isApiCallProcess = false;
    _marcasEntriesList = null;
    _selectedMarcas = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllMarcas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/header_2.png'), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Form(
                key: globalFormKey,
                child: Column(
                  children: [
                    Text(
                      "Información de tu coche",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w800,
                        fontSize: 22.0,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30, top: 15, right: 30, bottom: 20),
                          child: Text(
                            "Debes introducir algunos datos tuyos y de tu vehículo, así como fotografías y/o un video, para poder solicitar a los profesionales que realicen una tasación de tu coche con una la máxima información posible",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.0,
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
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              DropdownButtonFormField<Entries>(
                                isExpanded: true,
                                decoration: inputDecorationDropDown(),
                                hint: Text("Selecciona Marcas",
                                  style: TextStyle(
                                    fontSize: 12.0
                                ),),
                                value: _selectedMarcas,
                                onChanged: (Entries value) {
                                  setState(() {
                                    _selectedMarcas = value;
                                  });
                                },
                                items:
                                    _marcasEntriesList?.map((Entries marcas) {
                                  return DropdownMenuItem<Entries>(
                                    value: marcas,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          marcas.texto,
                                          style: TextStyle(color: Colors.black,
                                          fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  );
                                })?.toList(),
                                validator: (value) {
                                  if (value == null)
                                    return "Please Selecciona marcas";
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 30.0)),
                            Expanded(
                                child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Modelo",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF1AB394),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0)),
                                  DropdownButtonFormField<Entries>(
                                    isExpanded: true,
                                    decoration: inputDecorationDropDown(),
                                    hint: Text("Selecciona Marcas",
                                    style: TextStyle(
                                      fontSize: 12.0
                                    ),),
                                    value: _selectedMarcas,
                                    onChanged: (Entries value) {
                                      setState(() {
                                        _selectedMarcas = value;
                                      });
                                    },
                                    items: _marcasEntriesList
                                        ?.map((Entries marcas) {
                                      return DropdownMenuItem<Entries>(
                                        value: marcas,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              marcas.texto,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      );
                                    })?.toList(),
                                    validator: (value) {
                                      if (value == null)
                                        return "Please Selecciona marcas";
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            )),
                            const Padding(padding: EdgeInsets.only(left:16.0)),
                            Expanded(
                                child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Versión",
                                    style: TextStyle(
                                      color: Color(0xFF1AB394),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 8.0)),
                                  TextFormField(
                                    onSaved: (input) => input,
                                    validator: (input) => input.isEmpty
                                        ? "Please enter Versión"
                                        : null,
                                    decoration: inputDecoration(),
                                  ),
                                ],
                              ),
                            )),
                            const Padding(
                                padding: EdgeInsets.only(right: 30.0)),
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
                                  "Combustible",
                                  style: TextStyle(
                                    color: Color(0xFF1AB394),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              DropdownButtonFormField<Entries>(
                                isExpanded: true,
                                decoration: inputDecorationDropDown(),
                                hint: Text("Selecciona Marcas",
                                  style: TextStyle(
                                      fontSize: 12.0
                                  ),),
                                value: _selectedMarcas,
                                onChanged: (Entries value) {
                                  setState(() {
                                    _selectedMarcas = value;
                                  });
                                },
                                items:
                                _marcasEntriesList?.map((Entries marcas) {
                                  return DropdownMenuItem<Entries>(
                                    value: marcas,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          marcas.texto,
                                          style: TextStyle(color: Colors.black,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  );
                                })?.toList(),
                                validator: (value) {
                                  if (value == null)
                                    return "Please Selecciona marcas";
                                  return null;
                                },
                              ),
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
                                color: ButtonColorPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistroCosioOne()),
                                  );
                                },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Siguiente",
                                    style: TextStyle(
                                      color: Color(0xFF1AB394),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(left: 8.0)),
                                  Icon(Icons.arrow_forward_outlined,color: PrimaryColor)
                                ],
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
                            size: const Size.square(8.0),
                            activeSize: const Size(8.0, 8.0),
                            spacing: const EdgeInsets.all(8.0),
                            color: Color(0xFFEEEAEA),
                            // Inactive color
                            activeColor: Color(0xFF1AB394),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }

  void getAllMarcas() {
    setState(() {
      isApiCallProcess = true;
      _progressDialogUtil.show();
    });
    APIService.getAllMarcas().then((value) {
      if (value != null) {
        setState(() {
          isApiCallProcess = false;
          _progressDialogUtil.dismiss();
          this._marcasEntriesList = value.entries;
        });

        print(value);
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
