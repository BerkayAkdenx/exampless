import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/person_save_cubit.dart';

class PersonSaveView extends StatefulWidget {
  const PersonSaveView({super.key});

  @override
  State<PersonSaveView> createState() => _PersonSaveViewState();
}

class _PersonSaveViewState extends State<PersonSaveView> {
  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("People"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(hintText: "Person Name"),
              ),
              TextField(
                controller: tfPersonPhone,
                decoration: const InputDecoration(hintText: "Person Phone"),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<PersonSaveCubit>()
                      .save(tfPersonName.text, tfPersonPhone.text);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
