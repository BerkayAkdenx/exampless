import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/repo/persons_dao_repository.dart';

class PersonSaveCubit extends Cubit<void> {
  PersonSaveCubit() : super(0);
  var pRepo = PersonsDaoRepository();

  Future<void> save(String personName, String personPhone) async {
    await pRepo.personSave(personName, personPhone);
  }
}
