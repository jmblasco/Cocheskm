import 'package:ars_progress_dialog/dialog.dart';
import 'package:cocheskm/api/api_service.dart';
import 'package:cocheskm/model/email_validation_model.dart';
import 'package:cocheskm/model/verify_email_code.dart';
import 'package:cocheskm/pages/register/vehicalRegistraion/RegisteroCosioOne.dart';
import 'package:cocheskm/utils/Constants.dart';
import 'package:cocheskm/utils/ProgressDialogUtil.dart';
import 'package:cocheskm/utils/SharedPrerferenceUtils.dart';
import 'package:cocheskm/widgets/Decoration.dart';
import 'package:flutter/cupertino.dart';
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
  var checkedValue = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  EmailValidationRequestModel emailValidationRequestModel;
  VerifyEmailCodeRequestModel _verifyEmailCodeRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ArsProgressDialog _arcProgressDialog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _arcProgressDialog = ProgressDialogUtil.arcProgressDialog(context);
    emailValidationRequestModel = EmailValidationRequestModel();
    _verifyEmailCodeRequestModel = VerifyEmailCodeRequestModel();
  }


  @override
  Widget build(BuildContext context) {
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
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistroCosioOne()),
                      );
                    },
                    child: Text(
                      "Verificaci??n de E-mail",
                      style: TextStyle(
                        color: Color(0xFF1AB394),
                        fontWeight: FontWeight.w900,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                    child: Text(
                      "Introduzca el c??digo que ha recibido en su e-mail. Si ha recibido m??s de uno utilice el ??ltimo recibido. Esta operaci??n ??nicamente es necesaria la primera vez que accede a su cuenta.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.0,
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
                                bottom: 8.0,
                              ),
                              child: Text(
                                "Codigo",
                                style: TextStyle(
                                  color: Color(0xFF1AB394),
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            Form(
                                key: globalFormKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (input) => {input,
                                  _verifyEmailCodeRequestModel.code = input},
                                  validator: (input) =>
                                    input.isEmpty
                                        ? "Please enter validation code"
                                        : null,

                                  // style: TextStyle(height: 0.8),
                                  decoration: inputDecoration(),
                                )),
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
                              onPressed: () async {
                                if (validateAndSave()) {
                                  _arcProgressDialog.show();
                                  int id = await SharedPreferenceUtil
                                      .getIntValuesSF(USER_ID_KEY) ?? -1;
                                  emailValidationRequestModel.id = id;
                                  APIService.verifyEmail(
                                      _verifyEmailCodeRequestModel)
                                      .then((value) {
                                    if (value != null) {
                                      setState(() {
                                        isApiCallProcess = false;
                                      });

                                      if (value.msg != null &&
                                          value.msg.isNotEmpty) {
                                        _arcProgressDialog.dismiss();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistroCosioOne()),
                                        );
                                      } else {
                                        _arcProgressDialog.dismiss();
                                        final snackBar = SnackBar(
                                            content: Text(value.error));
                                        scaffoldKey.currentState
                                            .showSnackBar(snackBar);
                                      }
                                    }
                                  }).onError((error, stackTrace) {
                                    _arcProgressDialog.dismiss();
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
                        padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                        child: Text(
                          "Si no tiene c??digo, lo ha borrado o ha caducado el que tiene, solicite uno nuevo.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12.0,
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
                              onPressed: () async {
                                _arcProgressDialog.show();
                                int id = await SharedPreferenceUtil
                                    .getIntValuesSF(USER_ID_KEY) ?? -1;
                                emailValidationRequestModel.id = id;
                                APIService.resendEmailValidation(
                                    emailValidationRequestModel)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.msg != null &&
                                        value.msg.isNotEmpty) {
                                      _arcProgressDialog.dismiss();
                                      final snackBar = SnackBar(
                                          content: Text(value.msg));
                                      scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                    } else {
                                      _arcProgressDialog.dismiss();
                                      final snackBar = SnackBar(
                                          content: Text(value.error));
                                      scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                }).onError((error, stackTrace) {
                                  _arcProgressDialog.dismiss();
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  final snackBar = SnackBar(
                                      content: Text(error));
                                  scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                });
                              },
                              child: Text(
                                "Recibir un c??digo nuevo",
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, bottom: 30),
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
