import 'package:fitness/Widgets/hi_container_widget.dart';
import 'package:fitness/Widgets/square_title.dart';
import 'package:fitness/service/auth_service.dart';
import 'package:fitness/views/login_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final AuthService _authService = AuthService();
  var tfName = TextEditingController();
  var tfEmail = TextEditingController();
  var tfPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 24),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: HiContainerWidget(
                  title: "Hi,Welcome Back",
                  desciption: "Register in to your account",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: tfName,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffb4b6bc),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      hintText: "Your name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: tfEmail,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffb4b6bc),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      hintText: "Your account"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: tfPassword,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffb4b6bc),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      hintText: "Password"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Or continue with"),
                  const Spacer(),
                  SquareTitle(
                    imagePath: "assets/loginAssets/facebook.png",
                    function: () {
                      print("facebook ile giriş ");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SquareTitle(
                      imagePath: "assets/loginAssets/google.png",
                      function: () {
                        print("google ile giriş ");
                      },
                    ),
                  ),
                  SquareTitle(
                    imagePath: "assets/loginAssets/appleBlack.png",
                    function: () {
                      print("apple ile giriş ");
                    },
                  )
                ],
              ),
              const SizedBox(height: 200),
              SizedBox(
                height: 60,
                width: 366,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F172A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13))),
                  onPressed: () {
                    _authService
                        .createPerson(
                            tfName.text, tfEmail.text, tfPassword.text)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView())));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
