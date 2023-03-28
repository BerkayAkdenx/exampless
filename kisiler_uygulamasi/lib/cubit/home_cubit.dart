import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/entitiy/Persons.dart';
import 'package:kisiler_uygulamasi/repo/persons_dao_repository.dart';

class HomeCubit extends Cubit<List<Persons>> {
  HomeCubit() : super(<Persons>[]);

  var pRepo = PersonsDaoRepository();

  Future<void> uploadToPersons() async {
    var list = await pRepo.showToPersons();
    emit(list);
  }

  Future<void> search(String result) async {
    var list = await pRepo.searchToPersons(result);
    emit(list);
  }

  Future<void> remove(int personId) async {
    await pRepo.personRemove(personId);
  }
}
