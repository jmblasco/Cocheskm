class EmailValidationResponseModel {
  String msg;
  String error;

  EmailValidationResponseModel(
      {this.msg,
      this.error});

  EmailValidationResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['error'] = this.error;
    return data;
  }
}

class EmailValidationRequestModel {
  int id;
  EmailValidationRequestModel({this.id});
  Map<String, int> toJson() {
    Map<String, int> map = {
      'id': id
    };
    return map;
  }
}
