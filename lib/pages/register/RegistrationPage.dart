import 'package:flutter/material.dart';
import 'package:cocheskm/ProgressHUD.dart';
import 'package:cocheskm/api/api_service.dart';
import 'package:cocheskm/model/registration_model.dart';
import 'package:cocheskm/pages/LoginPage.dart';
import 'package:cocheskm/utils/colors.dart';
import 'package:cocheskm/widgets/Decoration.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var checkedValue = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  RegistrationRequestModel registrationRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registrationRequestModel = RegistrationRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/header_1.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Registrate y gestiona tu Zona",
                          style: TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Escribe tus datos.",
                          style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 14.0,
                          ),
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        color: Color(0xFF1AB394),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    onSaved: (input) =>
                                    registrationRequestModel.email = input,
                                    validator: (input) => input.isEmpty
                                        ? "Please enter email or username"
                                        : null,
                                    // style: TextStyle(height: 0.8),
                                    decoration: inputDecoration(),
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Apodo",
                                      style: TextStyle(
                                        color: Color(0xFF1AB394),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    // style: TextStyle(height: 0.8),
                                    keyboardType: TextInputType.text,
                                    onSaved: (input) =>
                                    registrationRequestModel.apodo = input,
                                    validator: (input) =>
                                    input.isEmpty ? "Please enter apodo" : null,
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Contraseña",
                                      style: TextStyle(
                                        color: Color(0xFF1AB394),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    onSaved: (input) => {
                                      registrationRequestModel.password = input,
                                      registrationRequestModel
                                          .password_confirmation = input
                                    },
                                    validator: (input) => input.length < 3
                                        ? "Password should be more than 3 characters"
                                        : null,
                                    decoration: inputDecoration(),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CheckboxListTile(
                                    title: Text(
                                      "Acepto las condiciones de uso y la política de privacidad de este sitio",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF1AB394),
                                    contentPadding: EdgeInsets.only(left: 5),
                                    value: checkedValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        checkedValue = !checkedValue;
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity
                                        .leading, //  <-- leading Checkbox
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
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
                                      if (validateAndSave()) {
                                        print(registrationRequestModel.toJson());
                                        setState(() {
                                          isApiCallProcess = true;
                                        });
                                        registrationRequestModel
                                            .setting_email_mensajes = true;
                                        registrationRequestModel
                                            .setting_email_promociones = true;
                                        registrationRequestModel
                                            .setting_mostrar_notificaciones = true;
                                        registrationRequestModel.validator = true;

                                        APIService.identification(
                                            registrationRequestModel)
                                            .then((value) {
                                          if (value != null) {
                                            setState(() {
                                              isApiCallProcess = false;
                                            });

                                            if (value.token != null  &&  value.token.isNotEmpty) {
                                              final snackBar = SnackBar(
                                                  content: Text(
                                                      "Registration Successful"));
                                              scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            } else {
                                              final snackBar = SnackBar(
                                                  content: Text(value.error));
                                              scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            }
                                          }
                                        }).onError((error, stackTrace) {
                                          setState(() {
                                            isApiCallProcess = false;
                                          });
                                          final snackBar = SnackBar(
                                              content: Text(error));
                                          scaffoldKey.currentState
                                              .showSnackBar(snackBar);
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Registrate",
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
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