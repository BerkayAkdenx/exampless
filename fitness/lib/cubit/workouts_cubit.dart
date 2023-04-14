import 'package:firebase_database/firebase_database.dart';
import 'package:fitness/model/workouts_model.dart';
import 'package:fitness/repo/workouts_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsCubit extends Cubit<List<Workouts>> {
  WorkoutsCubit() : super(<Workouts>[]);

  var wRepo = WorkoutsDaoRepository();
  var redWorkouts = FirebaseDatabase.instance.ref().child("workouts");
  Future<void> uploadToWorkouts() async {
    redWorkouts.onValue.listen((event) {
      var receivedValue = event.snapshot.value as dynamic;
      if (receivedValue != null) {
        var list = <Workouts>[];
        receivedValue.forEach((key, object) {
          var training = Workouts.fromJson(key, object);
          list.add(training);
        });
        emit(list);
      }
    });
  }

  Future<void> remove(String trainingId) async {
    await wRepo.workoutsRemove(trainingId);
  }
}
