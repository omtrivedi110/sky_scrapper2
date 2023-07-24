import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper2/controller/apicontroller.dart';
import 'package:sky_scrapper2/views/screens/bookmarked.dart';
import 'package:sky_scrapper2/views/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pres = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiController(pref: pres),
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
        'bookmark': (context) => Bookmarked(),
      },
    );
  }
}
