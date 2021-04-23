class MarcasResponseModel {
  List<Entries> entries;

  MarcasResponseModel({this.entries});

  MarcasResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['entries'] != null) {
      entries = new List<Entries>();
      json['entries'].forEach((v) {
        entries.add(new Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entries != null) {
      data['entries'] = this.entries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  int id;
  String texto;

  Entries({this.id, this.texto});

  Entries.fromJson(Map<String, dynamic> json) {
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
