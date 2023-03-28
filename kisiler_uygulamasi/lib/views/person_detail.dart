import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/person_detail_cubit.dart';
import 'package:kisiler_uygulamasi/entitiy/Persons.dart';

class PersonDetailView extends StatefulWidget {
  Persons person;
  PersonDetailView({super.key, required this.person});
  @override
  State<PersonDetailView> createState() => _PersonDetailViewState();
}

class _PersonDetailViewState extends State<PersonDetailView> {
  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.person_name;
    tfPersonPhone.text = person.person_phone;
  }

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
                  context.read<PersonDetailCubit>().update(
                      widget.person.person_id,
                      tfPersonName.text,
                      tfPersonPhone.text);
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
