class VerifyEmailCodeResponseModel {
  String msg;
  String error;

  VerifyEmailCodeResponseModel(
      {this.msg,
        this.error});

  VerifyEmailCodeResponseModel.fromJson(Map<String, dynamic> json) {
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

class VerifyEmailCodeRequestModel {
  String code;
  VerifyEmailCodeRequestModel({this.code});
  Map<String, String> toJson() {
    Map<String, String> map = {
      'code': code
    };
    return map;
  }
}
