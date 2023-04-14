import 'package:fitness/views/login_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              )),
          child: const Text(
            "FitTrack",
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
