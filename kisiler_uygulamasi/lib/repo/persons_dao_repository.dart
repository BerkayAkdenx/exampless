import 'package:kisiler_uygulamasi/entitiy/Persons.dart';

class PersonsDaoRepository {
  Future<void> personSave(String personName, String personPhone) async {
    print("Person save : $personName - $personPhone");
  }

  Future<void> personUpdate(
      int personId, String personName, String personPhone) async {
    print("Person update : $personId - $personName - $personPhone");
  }

  Future<List<Persons>> showToPersons() async {
    var personsList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: "Ahmet", person_phone: "1111");
    var p2 = Persons(person_id: 2, person_name: "Zeynep", person_phone: "2222");
    var p3 = Persons(person_id: 3, person_name: "Beyz", person_phone: "3333");
    personsList.add(p1);
    personsList.add(p2);
    personsList.add(p3);
    return personsList;
  }

  Future<List<Persons>> searchToPersons(String result) async {
    var personsList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: "Ahmet", person_phone: "1111");

    personsList.add(p1);

    return personsList;
  }

  Future<void> personRemove(int personId) async {
    print("person remove : $personId");
  }
}
