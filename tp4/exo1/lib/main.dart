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
  static ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            theme: ThemeData(
              primarySwatch: Colors.green, //Color(0xFFAEEA00)
            ),
            home: const MyHomePage(
                title: 'Questions / Réponses'
            ),
          );
        }
    );
  }
}