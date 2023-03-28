import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/home_cubit.dart';
import 'package:kisiler_uygulamasi/entitiy/Persons.dart';
import 'package:kisiler_uygulamasi/views/person_detail.dart';
import 'package:kisiler_uygulamasi/views/person_save_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool search = false;
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().uploadToPersons();

    super.initState();
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
                  context.read<HomeCubit>().search(searchResult);
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
                    context.read<HomeCubit>().uploadToPersons();
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
      body: BlocBuilder<HomeCubit, List<Persons>>(
        builder: (context, personsList) {
          if (personsList.isNotEmpty) {
            return ListView.builder(
              itemCount: personsList.length,
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
                                      context
                                          .read<HomeCubit>()
                                          .remove(person.person_id);
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PersonSaveView())).then((value) {
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
