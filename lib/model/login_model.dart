class LoginResponseModel {
  String msg;
  bool esVendedor;
  int id;
  String token;
  String canalAvisos;
  bool emailVerificado;
  String error;

  LoginResponseModel(
      {this.msg,
      this.esVendedor,
      this.id,
      this.token,
      this.canalAvisos,
      this.emailVerificado,
      this.error});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    esVendedor = json['es_vendedor'];
    id = json['id'];
    token = json['token'];
    canalAvisos = json['canal_avisos'];
    emailVerificado = json['email_verificado'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['es_vendedor'] = this.esVendedor;
    data['id'] = this.id;
    data['token'] = this.token;
    data['canal_avisos'] = this.canalAvisos;
    data['email_verificado'] = this.emailVerificado;
    data['error'] = this.error;
    return data;
  }
}

class LoginRequestModel {
  String email;
  String password;
  bool validator;

  LoginRequestModel({this.email, this.password, this.validator});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
      'vendor': validator.toString()
    };

    return map;
  }
}
