import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './ecranAccueil.dart';
import './addquestion.dart';
import 'package:exo1/database/DB.dart';
import '../main.dart';

class MyResultats extends StatefulWidget {

  const MyResultats({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyResultats> createState() => Resultats();
}
class Resultats extends State<MyResultats> {
  final firestoreInstance = FirebaseFirestore.instance;

  void gotoHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
    );
  }
  void gotoAdd(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addquestion(title: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    DB.description_();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                setState(() {
                  MyApp.themeNotifier.value = (MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light) ;
                });
                //MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
              })
        ],
        title: const Text("Questions / Réponses"),
      ),
      body:RawScrollbar(
        thumbColor: const Color(0xFFFF80AB),
        thickness: 10,
        isAlwaysShown: true,
        radius: Radius.circular(10),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 40, right: 10),
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFF607D8B),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        gotoHome(context);
                        setState(() {
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF76FF03),
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              'Refaire le quizz',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                  //margin: EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      gotoAdd(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFF80AB),
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              'Ajouter une question',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
