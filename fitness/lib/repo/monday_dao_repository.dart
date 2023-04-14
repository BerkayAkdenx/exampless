import 'package:firebase_database/firebase_database.dart';

class MondayWorkoutsDaoRepository {
  var refMonday = FirebaseDatabase.instance.ref().child("monday");
  Future<void> workoutsSave(String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_id"] = "";
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refMonday.push().set(info);
  }

  Future<void> workoutsUpdate(
      String trainingId, String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refMonday.child(trainingId).update(info);
  }

  Future<void> workoutsRemove(String trainingId) async {
    refMonday.child(trainingId).remove();
  }
}
