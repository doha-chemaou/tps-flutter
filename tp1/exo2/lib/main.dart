import 'package:flutter/material.dart';

//---------------------------------------------------------------
/*void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => const EcranAccueil(title: '',),
      //'/qu1' : (context) => Question1(),
      '/qu2' : (context) => Question2(),
      '/qu3' : (context) => Question3(),
      '/qu4' : (context) => Question4(),
      '/res' : (context) => Resultats(),
    },
  )

  );
}*/

void main() => runApp(const MyApp());

bool rep1 = false, rep2 = false, rep3 = false, rep4 = false;
String s_rep1 = "fausse",s_rep2="fausse",s_rep3="fausse",s_rep4="fausse";

void booltoString(){
  if(rep1) s_rep1 = "juste";
  if(rep2) s_rep2 = "juste";
  if(rep3) s_rep3 = "juste";
  if(rep4) s_rep4 = "juste";
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String description = "Bienvenue au Quizz. \nVous aurez 4 questions "
      "auxquelles vous pouvez répondre. \nPour chacune d'elles, vous avez "
      "4 propositions, l'une d'elle est juste. \nEn cliquant sur l'une d'elles "
      "ceci enregistrera votre réponse. \nSi vous souhaitez ne pas répondre à "
      "une question , vous pouvez cliquer sur le bouton (passer à la question "
      "suivante). \nA la fin du quizz, vous aurez le résultat. \nVous pourrez ainsi "
      "refaire le quizz si vous le souhaitez";


  void gotoQu1(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyQu1(title: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:300,
              height:490,
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
                  gotoQu1(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                  onPrimary: Colors.white, // foreground
                ),
                //color: Theme.of(context).accentColor,
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

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
*/

class MyQu1 extends StatefulWidget {
  const MyQu1({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyQu1> createState() => Qu1();
}

class Qu1 extends State<MyQu1>{
  String description = "Quel pays a remporté la coupe du monde de football en 2014 ?";
  void gotoQu2(BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyQu2(title: '',)),
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only( bottom: 20),
            child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xFFFF80AB),
                    image: const DecorationImage(
                        image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: const Color(0xFFFF80AB),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  width:250,
                  height:250,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only( bottom: 20),
                width:300,
              height:125,
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
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Expanded(
              ElevatedButton(
              onPressed: () {
                gotoQu2(context);
              },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
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
                  'Allemagne',
                  style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  ),
                  ),
                  ],
                  ),
                  ),
                  ),
              ),
                  //),
                  SizedBox(width: 5),
                   ElevatedButton(
                      onPressed: () {
                        gotoQu2(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'Argentine',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: 5),
            ],),),),
                  Container(
                    //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      gotoQu2(context);
                      rep1 = true;
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              'Italie',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      gotoQu2(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              'Brésil',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
      ),
            ),

            Container(
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
              //margin: EdgeInsets.all(10),
              margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
              child: ElevatedButton(
                onPressed: () {
                  gotoQu2(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                  onPrimary: Colors.white, // foreground
                ),
                //color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Passer à la question suivante',
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
    throw UnimplementedError();
  }

}

class MyQu2 extends StatefulWidget {
  const MyQu2({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyQu2> createState() => Qu2();
}

class Qu2 extends State<MyQu2>{
  String description = "Dans quelle ville italienne l'action de la pièce"
      " Shakespeare (Roméo et Juliette) se situe-elle ?";
  void gotoQu3(BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyQu3(title: '',)),
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only( bottom: 20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xFFFF80AB),
                    image: const DecorationImage(
                        image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-5.jpg"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: const Color(0xFFFF80AB),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  width:250,
                  height:250,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only( bottom: 20),
              width:300,
              height:140,
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
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Expanded(
                    ElevatedButton(
                      onPressed: () {
                        gotoQu3(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
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
                                'Venise',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        gotoQu3(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'Rome',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        gotoQu3(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'Milan',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        gotoQu3(context);
                        rep2=true;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'Vérone',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Container(
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
              //margin: EdgeInsets.all(10),
              margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
              child: ElevatedButton(
                onPressed: () {
                  gotoQu3(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                  onPrimary: Colors.white, // foreground
                ),
                //color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Passer à la question suivante',
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
      ),    );
    throw UnimplementedError();
  }

}

class MyQu3 extends StatefulWidget {
  const MyQu3({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyQu3> createState() => Qu3();
}

class Qu3 extends State<MyQu3>{
  String description = "Parmi les animaux suivants, lequel peut "
      "se déplacer le plus rapidement ?";

  void gotoQu4(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyQu4(title: '',)),
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only( bottom: 20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xFFFF80AB),
                    image: const DecorationImage(
                        image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-8.jpg"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: const Color(0xFFFF80AB),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  width:250,
                  height:250,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only( bottom: 20),
              width:300,
              height:125,
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
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Expanded(
                    ElevatedButton(
                      onPressed: () {
                        gotoQu4(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
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
                                'léopard',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //),
                    SizedBox(width: 5),

                    ElevatedButton(
                      onPressed: () {
                        gotoQu4(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'mgdobe',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        gotoQu4(context);
                        rep3 = true;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'springbok',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            Container(
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        gotoQu4(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'chevreuil',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Container(
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
              //margin: EdgeInsets.all(10),
              margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
              child: ElevatedButton(
                onPressed: () {
                  gotoQu4(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                  onPrimary: Colors.white, // foreground
                ),
                //color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Passer à la question suivante',
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
      ),    );
    throw UnimplementedError();
  }

}

class MyQu4 extends StatefulWidget {
  const MyQu4({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyQu4> createState() => Qu4();
}

class Qu4 extends State<MyQu4>{
  String description = "Qui a dit : « Le sort en est jeté » (Alea jacta est) ?";

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
        title: const Text("Questions / Réponses"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only( bottom: 20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    //color: const Color(0xFFFF80AB),
                    image: const DecorationImage(
                        image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-2.jpg"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: const Color(0xFFFF80AB),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  width:250,
                  height:250,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only( bottom: 20),
              width:300,
              height:100,
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
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Expanded(
                    ElevatedButton(
                      onPressed: () {
                        gotoResultats(context);
                        booltoString();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
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
                                'Attila',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        gotoResultats(context);
                        rep4 = true;
                        booltoString();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'César',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),

                    ElevatedButton(
                      onPressed: () {
                        gotoResultats(context);
                        booltoString();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'Auguste',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            Container(
              //constraints: BoxConstraints(maxWidth: 100.A0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        gotoResultats(context);
                        booltoString();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          //margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text(
                                'Vercingétorix',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Container(
              constraints: BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
              //margin: EdgeInsets.all(10),
              margin: const EdgeInsets.only( left: 10, top: 20,right: 10),
              child: ElevatedButton(
                onPressed: () {
                  gotoResultats(context);
                  booltoString();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                  onPrimary: Colors.white, // foreground
                ),
                //color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Passer cette question et voir les résultats',
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
      ),    );
  }

}
class MyResultats extends StatefulWidget {
  const MyResultats({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyResultats> createState() => Resultats();
}

class Resultats extends State<MyResultats>{

  String description = "Resultats : \n\n\n"
      "Question 1 : $s_rep1 \n\n"
      "Question 2 : $s_rep2 \n\n"
      "Question 3 : $s_rep3 \n\n"
      "Question 4 : $s_rep4 \n\n";
  void gotoHome(BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:300,
              height:490,
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
                  gotoHome(context);
                  rep1 = false;
                  rep2 = false;
                  rep3 = false;
                  rep4 = false;
                  s_rep1 = "fausse";
                  s_rep2 = "fausse";
                  s_rep3 = "fausse";
                  s_rep4 = "fausse";

                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF76FF03), // background //0xFFAEEA00  0xFF64DD17 0xFF7CB342
                  onPrimary: Colors.white, // foreground
                ),
                //color: Theme.of(context).accentColor,
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
          ],
        ),
      ),
    );
  }

}