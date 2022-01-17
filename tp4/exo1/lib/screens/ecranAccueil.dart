

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exo1/database/DB.dart';
import './quizz.dart';
import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String description = "Bienvenue au Quizz. \nVous aurez des questions "
      "auxquelles vous pouvez répondre. \nPour chacune d'elles, vous avez "
      "4 propositions, seule l'une d'elle est juste. \nA la fin du quizz, vous aurez le résultat. \nVous pourrez ainsi "
      "refaire le quizz si vous le souhaitez ou bien participer à l'enrichissement de ce quizz en ajoutant une question.";


  void gotoQu1(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyQu1(title: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    DB.meth();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                setState(() {
                  MyApp.themeNotifier.value = (MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light) ;
                });
                //MyApp.themeNotifier =  MyApp.themeNotifier.value == ThemeMode.light? ValueNotifier(ThemeMode.dark) : ValueNotifier(ThemeMode.light);
                //MyApp.themeNotifier.value = ((MyApp.themeNotifier.value == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light);
//                print(MyApp.themeNotifier.value);

                //icon: Icon(MyApp.themeNotifier.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode);
              }

              )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:300,
              //height:490,
              //color: const Color(0xFF607D8B),
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
              //margin: EdgeInsets.all(10),
              margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
              child: ElevatedButton(
                onPressed: () {
                  for (int i = 0 ; i < liste.length  ; i++)
                    FirebaseFirestore.instance.collection('questions').doc(liste_[i]).update({'réponse choisie': ""});
                  resultats_ = [];
                  gotoQu1(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03),
                  onPrimary: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Commencer le Quizz',
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
    );
  }
}
