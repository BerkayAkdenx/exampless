import 'package:flutter/material.dart';
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

  Future<void> update(
      int personId, String personName, String personPhone) async {
    print("Person update : $personId - $personName - $personPhone");
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
                  update(widget.person.person_id, widget.person.person_name,
                      widget.person.person_phone);
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
