import 'package:firebase_database/firebase_database.dart';

class TuesdayWorkoutsDaoRepository {
  var refTuesday = FirebaseDatabase.instance.ref().child("tuesday");
  Future<void> workoutsSave(String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_id"] = "";
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refTuesday.push().set(info);
  }

  Future<void> workoutsUpdate(
      String trainingId, String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refTuesday.child(trainingId).update(info);
  }

  Future<void> workoutsRemove(String trainingId) async {
    refTuesday.child(trainingId).remove();
  }
}
