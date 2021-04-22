import 'package:cocheskm/ProgressHUD.dart';
import 'package:cocheskm/api/api_service.dart';
import 'package:cocheskm/model/login_model.dart';
import 'package:cocheskm/pages/register/RegistrationPage.dart';
import 'package:cocheskm/utils/Constants.dart';
import 'package:cocheskm/utils/SharedPrerferenceUtils.dart';
import 'package:cocheskm/utils/colors.dart';
import 'package:cocheskm/widgets/Decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/header_1.png'),
                      fit: BoxFit.fill)),
            ),
            Form(
              key: globalFormKey,
              child: Column(
                children: [
                  Text(
                    "Inicia sesión en tu \nZona particular",
                    style: TextStyle(
                      color: PrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    "Utiliza tu email o apodo para identificarte",
                    style: TextStyle(
                      color: PrimaryColor,
                      fontSize: 14.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                "Correo electrónico",
                                style: TextStyle(
                                  color: PrimaryColor,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            TextFormField(
                              // style: TextStyle(height: 0.8),
                              keyboardType: TextInputType.text,
                              onSaved: (input) =>
                                  loginRequestModel.email = input,
                              validator: (input) => input.isEmpty
                                  ? "Please enter email or username"
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
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Contraseña",
                                style: TextStyle(
                                  color: PrimaryColor,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            TextFormField(
                              // style: TextStyle(height: 0.8),
                              keyboardType: TextInputType.text,
                              onSaved: (input) =>
                                  loginRequestModel.password = input,
                              validator: (input) => input.length < 3
                                  ? "Password should be more than 3 characters"
                                  : null,
                              decoration: inputDecoration(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, right: 30.0),
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0, bottom: 20.0),
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
                                  print(loginRequestModel.toJson());

                                  setState(() {
                                    isApiCallProcess = true;
                                  });
                                  loginRequestModel.validator = true;

                                  APIService.login(loginRequestModel)
                                      .then((value) {
                                    if (value != null) {
                                      setState(() {
                                        isApiCallProcess = false;
                                      });

                                      if (value.token != null &&
                                          value.token.isNotEmpty) {
                                        SharedPreferenceUtil.addStringToSF(USER_SESSION_KEY, value.token);
                                        SharedPreferenceUtil.addIntToSF(USER_ID_KEY, value.id);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.msg)));

                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.error)));

                                      }
                                    }
                                  }).onError((error, stackTrace) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                                  });
                                }
                              },
                              child: Text(
                                "Acceso",
                                style: TextStyle(
                                  color: Color(0xFF1AB394),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                            new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage()),
                                  );
                                },
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: new TextSpan(
                                    text:
                                        'Si eres un profesional accede desde',
                                    style: TextStyle(
                                        color: Color(0xFF1AB394),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text: '  aqui.',
                                          style: new TextStyle(
                                              color: Color(0xFF1AB394),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
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
