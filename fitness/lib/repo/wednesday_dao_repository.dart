import 'package:firebase_database/firebase_database.dart';

class WednesdayWorkoutsDaoRepository {
  var refWorkouts = FirebaseDatabase.instance.ref().child("wednesday");
  Future<void> workoutsSave(String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_id"] = "";
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refWorkouts.push().set(info);
  }

  Future<void> workoutsUpdate(
      String trainingId, String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refWorkouts.child(trainingId).update(info);
  }

  Future<void> workoutsRemove(String trainingId) async {
    refWorkouts.child(trainingId).remove();
  }
}
