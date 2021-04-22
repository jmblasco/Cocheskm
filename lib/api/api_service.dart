import 'package:cocheskm/model/email_validation_model.dart';
import 'package:cocheskm/model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {

  static String BASE_API_URL = "http://dev1.cocheskm.com.es:3099/api/v1";
  static String LOGIN_END_POINT = "/identificacion";
  static String REGISTRATION_END_POINT = "/particulares";
  static String NEW_CODIGO_END_POINT = "/new_codigo_verify_email";
  static String VERIFY_EMAIL_END_POINT = "/verify_email";
  static Map<String, String> headerMap = {"Api-Key": "DEV-apikey"};

  static Future<LoginResponseModel> login(
      LoginRequestModel requestModel) async {
    String url = BASE_API_URL + LOGIN_END_POINT;
    final response = await http.post(Uri.encodeFull(url),
        headers: headerMap, body: requestModel.toJson());
    return LoginResponseModel.fromJson(
      json.decode(response.body),
    );
  }

  static Future<RegistrationResponseModel> identification(
      RegistrationRequestModel requestModel) async {
    String url = BASE_API_URL + REGISTRATION_END_POINT;
    final response = await http.post(Uri.encodeFull(url),
        headers: headerMap, body: requestModel.toJson());
    return RegistrationResponseModel.fromJson(
      json.decode(response.body),
    );
  }

  static Future<EmailValidationResponseModel> verifyEmail(
      EmailValidationRequestModel requestModel) async {

    String url = BASE_API_URL + REGISTRATION_END_POINT+"/${requestModel.id}"+VERIFY_EMAIL_END_POINT;
    final response = await http.post(Uri.encodeFull(url),
        headers: headerMap);
    return EmailValidationResponseModel.fromJson(
      json.decode(response.body),
    );
  }

  static Future<EmailValidationResponseModel> resendEmailValidation(
      EmailValidationRequestModel requestModel) async {
    String url = BASE_API_URL +
        REGISTRATION_END_POINT +
        "/${requestModel.id}" +
        NEW_CODIGO_END_POINT;
    final response =
        await http.get(Uri.encodeFull(url), headers: headerMap);

    return EmailValidationResponseModel.fromJson(json.decode(response.body));
  }
}
