import 'package:firebase_database/firebase_database.dart';

class PersonsDaoRepository {
  var refPersons = FirebaseDatabase.instance.ref().child("kisiler");
  Future<void> personSave(String personName, String personPhone) async {
    var info = <String, dynamic>{};
    info["kisi_id"] = "";
    info["kisi_ad"] = personName;
    info["kisi_tel"] = personPhone;
    refPersons.push().set(info);
  }

  Future<void> personUpdate(
      String personId, String personName, String personPhone) async {
    var info = <String, dynamic>{};
    info["kisi_ad"] = personName;
    info["kisi_tel"] = personPhone;
    refPersons.child(personId).update(info);
  }

  Future<void> personRemove(String personId) async {
    refPersons.child(personId).remove();
  }
}
