import 'package:fitness/Widgets/text_container_widget.dart';
import 'package:fitness/cubit/workouts_detail_cubit.dart';
import 'package:fitness/model/workouts_model.dart';
import 'package:fitness/service/auth_service.dart';
import 'package:fitness/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsDetailView extends StatefulWidget {
  WorkoutsDetailView({super.key, required this.training});
  Workouts training;
  @override
  State<WorkoutsDetailView> createState() => _WorkoutsDetailViewState();
}

class _WorkoutsDetailViewState extends State<WorkoutsDetailView> {
  var tftrainingName = TextEditingController();
  var tftrainingTime = TextEditingController();
  final AuthService _authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var training = widget.training;
    tftrainingName.text = training.training_name;
    tftrainingTime.text = training.training_time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          widget.training.training_name,
          style: const TextStyle(fontSize: 24),
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
                title: "After changing the program, don't forget to update it.",
              ),
              TextField(
                controller: tftrainingName,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffb4b6bc),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(13))),
                  hintText: "training Name",
                ),
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
                      hintText: "training time"),
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
                            .read<WorkoutsDetailCubit>()
                            .update(
                                widget.training.training_id,
                                tftrainingName.text.trim(),
                                tftrainingTime.text.trim())
                            .then((value) => Navigator.pop(context));
                      },
                      child: const Text("Update"),
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
