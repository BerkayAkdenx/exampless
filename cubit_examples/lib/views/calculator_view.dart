import 'package:cubit_examples/cubit/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final firstNumber = TextEditingController();
  final secondNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: BlocBuilder<CalculatorCubit, int>(
        builder: (context, index) {
          return Text("Sum : ${index.toString()}");
        },
      )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<CalculatorCubit, int>(
            builder: (context, index) {
              return Text("Sum : $index");
            },
          ),
          // ignore: unnecessary_brace_in_string_interps

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: TextField(
              controller: firstNumber,
              decoration: const InputDecoration(
                  hintText: "Enter Your Number",
                  labelText: "First Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: secondNumber,
              decoration: const InputDecoration(
                hintText: "Enter Your Number",
                labelText: "Second Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      String numberFirst = firstNumber.text;
                      String numberSecond = secondNumber.text;
                      context
                          .read<CalculatorCubit>()
                          .plus(numberFirst, numberSecond);
                    },
                    child: const Text("Add")),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      String numberFirst = firstNumber.text;
                      String numberSecond = secondNumber.text;
                      context
                          .read<CalculatorCubit>()
                          .multipy(numberFirst, numberSecond);
                    },
                    child: const Text("Multiply")),
              )
            ],
          )
        ],
      )),
    );
  }
}
