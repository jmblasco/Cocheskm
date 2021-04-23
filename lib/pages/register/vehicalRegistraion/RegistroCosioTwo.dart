import 'dart:convert';
import 'package:ars_progress_dialog/dialog.dart';
import 'package:cocheskm/api/api_service.dart';
import 'package:cocheskm/model/cities_model.dart';
import 'package:cocheskm/model/province_response.dart';
import 'package:cocheskm/utils/ProgressDialogUtil.dart';
import 'package:cocheskm/widgets/Decoration.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'RegistroCosioThree.dart';

class RegisteroCosioTwo extends StatelessWidget {
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
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ArsProgressDialog _progressDialogUtil;

  ProvincesResponseModel _selectedProvince;
  CitiesResponseModel _citiesResponseModel;
  List<ProvincesResponseModel> _provinceResponse;
  List<CitiesResponseModel> _citiesResponseList;

  @override
  void initState() {
    super.initState();
    isApiCallProcess = false;
    _selectedProvince = null;
    _citiesResponseModel = null;
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
    return Scaffold(
      key: scaffoldKey,
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
                        key: globalFormKey,
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
                                    onSaved: (input) => input,
                                    validator: (input) => input.isEmpty
                                        ? "Please enter Nombre completo"
                                        : null,
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
                                      "Número de Móvil",
                                      style: TextStyle(
                                        color: Color(0xFF1AB394),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    onSaved: (input) => input,
                                    validator: (input) => input.isEmpty
                                        ? "Please enter Número de Móvil"
                                        : null,
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
                                      child: DropdownButtonFormField<
                                          ProvincesResponseModel>(
                                        isExpanded: true,
                                        decoration: inputDecorationDropDown(),
                                        hint: Text(
                                          "Selecciona Provincia",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        value: _selectedProvince,
                                        onChanged:
                                            (ProvincesResponseModel value) {
                                          setState(() {
                                            _selectedProvince = value;
                                          });

                                          getAllCities(value.id);
                                        },
                                        items: _provinceResponse?.map(
                                            (ProvincesResponseModel province) {
                                          return DropdownMenuItem<
                                              ProvincesResponseModel>(
                                            value: province,
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  province.texto,
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
                                            return "Please Selecciona Provincia";
                                          return null;
                                        },
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
                                  Container(
                                    child: Container(
                                      child: DropdownButtonFormField<
                                          CitiesResponseModel>(
                                        isExpanded: true,
                                        decoration: inputDecorationDropDown(),
                                        hint: Text(
                                          "Selecciona Población",
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        value: _citiesResponseModel,
                                        onChanged: (CitiesResponseModel value) {
                                          setState(() {
                                            _citiesResponseModel = value;
                                          });
                                        },
                                        items: _citiesResponseList
                                            ?.map((CitiesResponseModel city) {
                                          return DropdownMenuItem<
                                              CitiesResponseModel>(
                                            value: city,
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  city.texto,
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
                                            return "Please Selecciona Provincia";
                                          return null;
                                        },
                                      ),
                                    ),
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
                                    color: Color(0x331AB394),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      if (validateAndSave()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisteroCosioThree()),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Siguiente",
                                      style: TextStyle(
                                        color: Color(0xFF1AB394),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
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
          this._provinceResponse = provinceResponse;
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

  void getAllCities(int id) {
    setState(() {
      isApiCallProcess = true;
      _progressDialogUtil.show();
    });
    APIService.getCitiesOfProvince(id).then((value) {
      if (value != null) {
        List<CitiesResponseModel> citiesResponse = (json.decode(value) as List)
            .map((data) => CitiesResponseModel.fromJson(data))
            .toList();
        setState(() {
          isApiCallProcess = false;
          _progressDialogUtil.dismiss();
          this._citiesResponseList = citiesResponse;
        });

        print(citiesResponse);
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
