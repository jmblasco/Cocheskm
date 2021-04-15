import 'package:cocheskm/model/registration_model.dart';
import 'package:cocheskm/utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  static Future<LoginResponseModel> login(
      LoginRequestModel requestModel) async {
    String url = BASE_API_URL + LOGIN_END_POINT;
    final response = await http.post(Uri.encodeFull(url),
        headers: {"Api-Key": "DEV-apikey"}, body: requestModel.toJson());
    return LoginResponseModel.fromJson(
      json.decode(response.body),
    );
  }

  static Future<RegistrationResponseModel> identification(
      RegistrationRequestModel requestModel) async {
    String url = BASE_API_URL + REGISTRATION_END_POINT;
    final response = await http.post(Uri.encodeFull(url),
        headers: {"Api-Key": "DEV-apikey"}, body: requestModel.toJson());
    return RegistrationResponseModel.fromJson(
      json.decode(response.body),
    );
  }
}
