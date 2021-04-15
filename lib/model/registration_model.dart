class RegistrationResponseModel {
  int id;
  String token;
  String canalAvisos;
  String error;

  RegistrationResponseModel(
      {this.id, this.token, this.canalAvisos, this.error});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    canalAvisos = json['canal_avisos'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['canal_avisos'] = this.canalAvisos;
    data['error'] = this.error;
    return data;
  }
}

class RegistrationRequestModel {
  String apodo;
  String email;
  String password;
  String password_confirmation;
  bool setting_email_mensajes;
  bool setting_email_promociones;
  bool setting_mostrar_notificaciones;
  bool validator;

  RegistrationRequestModel(
      {this.apodo,
      this.email,
      this.password,
      this.password_confirmation,
      this.setting_email_mensajes,
      this.setting_email_promociones,
      this.setting_mostrar_notificaciones,
      this.validator});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'apodo': apodo.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'password_confirmation': password_confirmation.trim(),
      'setting_email_mensajes': setting_email_mensajes.toString(),
      'setting_email_promociones': setting_email_promociones.toString(),
      'setting_mostrar_notificaciones':
          setting_mostrar_notificaciones.toString(),
      'vendor': validator.toString()
    };

    return map;
  }
}
