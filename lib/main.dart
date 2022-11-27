import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick_tick_app/provider/assignments_provider.dart';

import 'screens/inbox_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => AssignmentProvider()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
