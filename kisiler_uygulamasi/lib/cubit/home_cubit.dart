import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/entitiy/Persons.dart';
import 'package:kisiler_uygulamasi/repo/persons_dao_repository.dart';

class HomeCubit extends Cubit<List<Persons>> {
  HomeCubit() : super(<Persons>[]);

  var pRepo = PersonsDaoRepository();
  var refPersons = FirebaseDatabase.instance.ref().child("kisiler");
  Future<void> uploadToPersons() async {
    refPersons.onValue.listen((event) {
      var receivedValue = event.snapshot.value as dynamic;
      if (receivedValue != null) {
        var list = <Persons>[];
        receivedValue.forEach((key, object) {
          var person = Persons.fromJson(key, object);
          list.add(person);
        });
        emit(list);
      }
    });
  }

  Future<void> search(String result) async {
    refPersons.onValue.listen((event) {
      var receivedValue = event.snapshot.value as dynamic;
      if (receivedValue != null) {
        var list = <Persons>[];
        receivedValue.forEach((key, object) {
          var person = Persons.fromJson(key, object);
          if (person.person_name.contains(result)) {
            list.add(person);
          }
        });
        emit(list);
      }
    });
  }

  Future<void> remove(String personId) async {
    await pRepo.personRemove(personId);
  }
}
