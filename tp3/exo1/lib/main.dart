import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:exo1/database/DB.dart';
import 'package:exo1/screens/ecranAccueil.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DB.fillingDB();
  DB.meth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,//Color(0xFFAEEA00)
      ),
      home: const MyHomePage(
          title: 'Questions / Réponses'
      ),
    );
  }
}