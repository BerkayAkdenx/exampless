import 'package:fitness/Widgets/text_container_widget.dart';
import 'package:fitness/cubit/workouts_save_cubit.dart';
import 'package:fitness/service/auth_service.dart';
import 'package:fitness/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsSaveView extends StatelessWidget {
  WorkoutsSaveView({super.key});
  final AuthService _authService = AuthService();
  var tftrainingName = TextEditingController();
  var tftrainingTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          "Training Add",
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextContainerWidget(
                title: "Add the workout of your choice.",
              ),
              TextField(
                controller: tftrainingName,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xffb4b6bc),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    hintText: "Training Name"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: tftrainingTime,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffb4b6bc),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      hintText: "Training Time"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    width: 176,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F172A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      onPressed: () {
                        context
                            .read<WorkoutsSaveCubit>()
                            .save(tftrainingName.text, tftrainingTime.text)
                            .then((value) => Navigator.pop(context));
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
