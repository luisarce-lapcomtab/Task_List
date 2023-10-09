import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_application/bloc/bloc/task_bloc.dart';
import 'package:tasks_application/page/home_page.dart';
import 'package:tasks_application/services/pocketbase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(PocketApi.instance),
      child: MaterialApp(
          title: 'Flutter Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const MyHomePage()),
    );
  }
}
