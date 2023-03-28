import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/repo/persons_dao_repository.dart';

class PersonDetailCubit extends Cubit<void> {
  PersonDetailCubit() : super(0);
  var pRepo = PersonsDaoRepository();
  Future<void> update(
      int personId, String personName, String personPhone) async {
    pRepo.personUpdate(personId, personName, personPhone);
  }
}
