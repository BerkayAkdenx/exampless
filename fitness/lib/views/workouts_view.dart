import 'package:fitness/cubit/workouts_cubit.dart';
import 'package:fitness/model/workouts_model.dart';
import 'package:fitness/service/auth_service.dart';
import 'package:fitness/views/home_view.dart';
import 'package:fitness/views/workouts_save_view.dart';
import 'package:fitness/views/workouts_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsView extends StatefulWidget {
  const WorkoutsView({super.key});

  @override
  State<WorkoutsView> createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  final AuthService _authService = AuthService();
  @override
  void initState() {
    context.read<WorkoutsCubit>().uploadToWorkouts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          "Workouts",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _authService.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
            },
            icon: const Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: BlocBuilder<WorkoutsCubit, List<Workouts>>(
        builder: (context, workoutsList) {
          if (workoutsList.isNotEmpty) {
            return ListView.builder(
              itemCount: workoutsList.length,
              itemBuilder: (context, index) {
                var training = workoutsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WorkoutsDetailView(training: training),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      color: const Color(0xffb4b6bc),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "${training.training_name} - ${training.training_time} min",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "${training.training_name} remove ?"),
                                    action: SnackBarAction(
                                      label: "Yes?",
                                      onPressed: () {
                                        context
                                            .read<WorkoutsCubit>()
                                            .remove(training.training_id);
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0F172A),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WorkoutsSaveView()))
              .then((value) {
            print("Anasayfa dönüldü");
          });

          /*  var person =
              Persons(person_id: 1, person_name: "ahmet", person_phone: "111");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PersonDetailView(
                        person: person,
                      ))).then((value) {
            print("Anasayfa dönüldü");
          });
          */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// detay yapılcak