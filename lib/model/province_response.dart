class ProvincesResponseModel {
  int id;
  String texto;

  ProvincesResponseModel({this.id, this.texto});

  ProvincesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['texto'] = this.texto;
    return data;
  }
}

