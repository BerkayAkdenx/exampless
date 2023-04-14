class Workouts {
  String training_id;
  String training_name;
  String training_time;

  Workouts({
    required this.training_id,
    required this.training_name,
    required this.training_time,
  });
  factory Workouts.fromJson(String key, Map<dynamic, dynamic> json) {
    return Workouts(
        training_id: key,
        training_name: json["training_name"] as String,
        training_time: json["training_time"] as String);
  }
}
