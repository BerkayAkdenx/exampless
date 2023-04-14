import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Widgets/days_container_widget.dart';
import 'package:fitness/Widgets/hello_container_widget.dart';
import 'package:fitness/Widgets/space_container_widget.dart';
import 'package:fitness/service/auth_service.dart';
import 'package:fitness/views/home_view.dart';
import 'package:flutter/material.dart';

class DaysView extends StatefulWidget {
  const DaysView({super.key});

  @override
  State<DaysView> createState() => _DaysViewState();
}

class _DaysViewState extends State<DaysView> {
  final AuthService _authService = AuthService();
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          "Days",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HelloContainerWidget(
              title: "Hello,${user!.email}",
              desciption: "Choose the day you want to make reservations",
            ),
            const DaysContainerWidget(day: "Monday"),
            const DaysContainerWidget(day: "Tuesday"),
            const DaysContainerWidget(day: "Wednesday"),
            const DaysContainerWidget(day: "Thursday"),
            const DaysContainerWidget(day: "Friday"),
            const DaysContainerWidget(day: "Sunday"),
            const SpaceContainerWidget(day: "day"),
          ],
        ),
      ),
    );
  }
}
