class Persons {
  String person_id;
  String person_name;
  String person_phone;
  Persons(
      {required this.person_id,
      required this.person_name,
      required this.person_phone});
  factory Persons.fromJson(String key, Map<dynamic, dynamic> json) {
    return Persons(
        person_id: key,
        person_name: json["kisi_ad"] as String,
        person_phone: json["kisi_tel"] as String);
  }
}
