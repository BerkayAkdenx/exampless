import 'package:fitness/repo/workouts_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsSaveCubit extends Cubit<void> {
  WorkoutsSaveCubit() : super(0);
  var wRepo = WorkoutsDaoRepository();

  Future<void> save(String trainingName, String trainingTime) async {
    await wRepo.workoutsSave(trainingName, trainingTime);
  }
}
