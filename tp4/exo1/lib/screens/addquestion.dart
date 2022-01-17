import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/page.dart';
import './ecranAccueil.dart';
import '../main.dart';
import 'package:exo1/database/DB.dart';

class Addquestion extends StatefulWidget {
  const Addquestion({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<Addquestion> createState() => Addqu();
}
class Addqu extends State<Addquestion>{

  void gotoHomepage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)),
    );

  }

  final titre = TextEditingController();
  final question = TextEditingController();
  final choix_1 = TextEditingController();
  final choix_2 = TextEditingController();
  final choix_3 = TextEditingController();
  final choix_4 = TextEditingController();
  final image_url = TextEditingController();
  final bonne_reponse = TextEditingController();


  @override
  void dispose() {
    titre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false ,
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
      body: RawScrollbar(
        thumbColor: const Color(0xFFFF80AB),
        thickness: 10,
        isAlwaysShown: true,
        radius: Radius.circular(10),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(//id
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'titre',
                  ),
                  controller: titre,

                ),
              ),
              Padding(//question
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'question',
                  ),
                  controller: question,

                ),
              ),
              Padding(// choix 1
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'choix 1',
                  ),
                  controller :choix_1,
                ),
              ),
              Padding(// choix 2
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'choix 2',
                  ),
                  controller : choix_2,
                ),
              ),
              Padding(// choix 3
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'choix 3',
                  ),
                  controller : choix_3,
                ),
              ),
              Padding(// choix 4
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'choix 4',
                  ),
                  controller : choix_4,
                ),
              ),
              Padding(// bonne réponse
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'bonne réponse',
                  ),
                  controller : bonne_reponse,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      if(!titre.text.isEmpty && !bonne_reponse.text.isEmpty && !question.text.isEmpty &&
                          !choix_1.text.isEmpty && !choix_2.text.isEmpty && !choix_3.text.isEmpty && !choix_4.text.isEmpty)
                        DB.addsQuestion(titre.text,"https://c8.alamy.com/compfr/r31yc2/alphabet-de-fleurs-question-mark-r31yc2.jpg",question.text,choix_1.text,choix_2.text,choix_3.text,choix_4.text,bonne_reponse.text.toString());
                      DB.meth();
                      gotoHomepage(context);
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
                            'Ajouter',
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
    );
  }

}
