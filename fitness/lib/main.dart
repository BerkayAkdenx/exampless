import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/cubit/workouts_cubit.dart';
import 'package:fitness/cubit/workouts_detail_cubit.dart';
import 'package:fitness/cubit/workouts_save_cubit.dart';
import 'package:fitness/firebase_options.dart';
import 'package:fitness/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WorkoutsSaveCubit()),
        BlocProvider(create: (context) => WorkoutsDetailCubit()),
        BlocProvider(create: (context) => WorkoutsCubit()),
      ],
      child: const MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: HomeView()),
    );
  }
}
