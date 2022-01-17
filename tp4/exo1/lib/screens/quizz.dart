import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import './results.dart';
import 'package:exo1/database/DB.dart';
import '../main.dart';

class MyQu1 extends StatefulWidget {
  const MyQu1({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyQu1> createState() => Qu1();
}
class Qu1 extends State<MyQu1>{
  void gotoResultats(BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyResultats(title: '',)),
    );
  }


  @override
  Widget build(BuildContext context) {

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            for (int i = 0 ; i < liste.length; i++)
              new Container(
                child: Column(children: [
                  new Container(margin: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(liste[i]["image_url"]),
                              fit: BoxFit.cover),
                          border: Border.all(
                            color: const Color(0xFFFF80AB),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(200),
                        ),
                        width: 100,
                        height: 100,
                      ),
                    ),),
                  new Container(
                    margin: const EdgeInsets.only( bottom: 20),
                    width:300,
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
                        liste[i]["question"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  new CheckboxGroup (
                      labels: <String>[
                        liste[i]["choix 1"],
                        liste[i]["choix 2"],
                        liste[i]["choix 3"],
                        liste[i]["choix 4"],
                      ],

                      onSelected: (List<String> checked) async {
                        //print(checked);
                        String value="";
                        // ce if de code permet de ne faire qu'une selection
                        if (checked.length > 1) {
                          checked.removeAt(0);
                        }

                        var collection = FirebaseFirestore.instance.collection('questions');
                        var docSnapshot = await collection.doc(liste_[i]).get();
                        if (docSnapshot.exists) {
                          Map<String, dynamic>? data = docSnapshot.data();
                          value = data?['bonne réponse'];
                          //print(value);
                        }
                        //print(checked);
                        print((checked.length==0? "pas de réponse donnée":(checked[0]==value? "'"+checked[0]+"' est la bonne réponse": "'"+checked[0]+"' est la mauvaise réponse")));
                        FirebaseFirestore.instance.collection('questions').doc(liste_[i]).update({'réponse choisie': (checked.length==0? "":checked[0])});
                      }
                  ),

                  Divider(
                    height: 50,
                    thickness: 5,
                    color : const Color(0xFFFF80AB) ,
                  ),

                ]),
              ),
            Container(
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
              margin: const EdgeInsets.only( left: 10, top: 20,right: 10,bottom:20),
              child : ElevatedButton(
                onPressed: () {
                  DB.description_();

                  Future.delayed(const Duration(milliseconds: 500), () {

                    gotoResultats(context);

                    setState(() {
                    });

                  });

                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFF80AB), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
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
                          'voir les résultats',
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
            Divider(
              height: 50,
              thickness: 5,
              color : const Color(0xFFFF80AB) ,
            ),

          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

}
