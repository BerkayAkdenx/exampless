import 'package:fitness/repo/workouts_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsDetailCubit extends Cubit<void> {
  WorkoutsDetailCubit() : super(0);
  var wRepo = WorkoutsDaoRepository();
  Future<void> update(
      String traininId, String trainingName, String trainingTime) async {
    wRepo.workoutsUpdate(traininId, trainingName, trainingTime);
  }
}
