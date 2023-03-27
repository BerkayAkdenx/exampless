import 'package:cubit_examples/cubit/calculator.dart';
import 'package:cubit_examples/views/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculatorCubit(),
        )
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: CalculatorView(),
      ),
    );
  }
}
