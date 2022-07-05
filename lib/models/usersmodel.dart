class Users {
  int? id;
  String? name;
  String? kelas;
  String? nisn;
  Users({this.id, this.name, this.kelas, this.nisn});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'],
        name: json['name'],
        kelas: json['class'],
        nisn: json['nisn']);
  }
  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    if (id != null) {
      json['id'] = id;
    }
    json['name'] = name;
    json['class'] = kelas;
    json['nisn'] = nisn;
    return json;
  }
}
