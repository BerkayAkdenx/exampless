import 'package:fitness/Widgets/hi_container_widget.dart';
import 'package:fitness/Widgets/square_title.dart';
import 'package:fitness/service/auth_service.dart';
import 'package:fitness/views/days_view.dart';
import 'package:fitness/views/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthService _authService = AuthService();
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
                  desciption: "Login in to your account",
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
                  InkWell(
                    child: const Text(
                      "Sign Up ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        )),
                  ),
                  const Text("Or "),
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
                    _authService.signIn(tfEmail.text, tfPassword.text).then(
                        (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DaysView())));
                  },
                  child: const Text(
                    "Sign In",
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
