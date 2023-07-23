// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper2/controller/apicontroller.dart';
import 'package:sky_scrapper2/views/screens/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
