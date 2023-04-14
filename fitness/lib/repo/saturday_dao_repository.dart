import 'package:firebase_database/firebase_database.dart';

class SaturdayWorkoutsDaoRepository {
  var refSaturday = FirebaseDatabase.instance.ref().child("saturday");
  Future<void> workoutsSave(String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_id"] = "";
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refSaturday.push().set(info);
  }

  Future<void> workoutsUpdate(
      String trainingId, String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refSaturday.child(trainingId).update(info);
  }

  Future<void> workoutsRemove(String trainingId) async {
    refSaturday.child(trainingId).remove();
  }
}
