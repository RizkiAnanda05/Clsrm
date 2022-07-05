class Mapelmodel {
  int? id;
  String? name;
  String? teachname;
  String? hari;
  String? jam;
  Mapelmodel({
    this.id,
    this.name,
    this.teachname,
    this.hari,
    this.jam,
  });
  factory Mapelmodel.fromJson(Map<String, dynamic> json) {
    return Mapelmodel(
        id: json['id'],
        name: json['name'],
        teachname: json['teachname'],
        hari: json['hari']);
  }
  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    if (id != null) {
      json['id'] = id;
    }
    json['name'] = name;
    json['teachname'] = teachname;
    json['hari'] = hari;
    json['jam'] = jam;
    return json;
  }
}
