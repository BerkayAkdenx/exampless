import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/home_cubit.dart';
import 'package:kisiler_uygulamasi/cubit/person_detail_cubit.dart';
import 'package:kisiler_uygulamasi/cubit/person_save_cubit.dart';
import 'package:kisiler_uygulamasi/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PersonSaveCubit()),
        BlocProvider(create: (context) => PersonDetailCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeView(),
      ),
    );
  }
}
