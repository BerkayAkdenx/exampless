import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/entitiy/Persons.dart';
import 'package:kisiler_uygulamasi/views/person_detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool search = false;

  Future<List<Persons>> showToPersons() async {
    var personsList = <Persons>[];
    var p1 = Persons(person_id: 1, person_name: "Ahmet", person_phone: "1111");
    var p2 = Persons(person_id: 2, person_name: "Zeynep", person_phone: "2222");
    var p3 = Persons(person_id: 3, person_name: "Beyz", person_phone: "3333");
    personsList.add(p1);
    personsList.add(p2);
    personsList.add(p3);
    return personsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: search
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (searchResult) {
                  print("Search result : $searchResult");
                },
              )
            : const Text("People"),
        actions: [
          search
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      search = false;
                    });
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      search = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Persons>>(
        future: showToPersons(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var personsList = snapshot.data;
            return ListView.builder(
              itemCount: personsList!.length,
              itemBuilder: (context, index) {
                var person = personsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PersonDetailView(person: person),
                        ));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Text("${person.person_name} - ${person.person_phone}"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${person.person_name} remove ?"),
                                  action: SnackBarAction(
                                    label: "EVET",
                                    onPressed: () {
                                      print(
                                          "Person remove : ${person.person_name}");
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.black54,
                            ))
                      ],
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
        onPressed: () {
          /*    Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PersonSaveView())).then((value) {
            print("Anasayfa dönüldü");
          });
          */
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
