import 'package:firebase_database/firebase_database.dart';

class ThursdayWorkoutsDaoRepository {
  var refThursday = FirebaseDatabase.instance.ref().child("thursday");
  Future<void> workoutsSave(String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_id"] = "";
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refThursday.push().set(info);
  }

  Future<void> workoutsUpdate(
      String trainingId, String trainingName, String trainingTime) async {
    var info = <String, dynamic>{};
    info["training_name"] = trainingName;
    info["training_time"] = trainingTime;
    refThursday.child(trainingId).update(info);
  }

  Future<void> workoutsRemove(String trainingId) async {
    refThursday.child(trainingId).remove();
  }
}
