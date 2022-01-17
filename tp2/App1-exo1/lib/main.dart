import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
//---------------------------------------------------------------

class Choices {
  final String ch1;
  final String ch2;
  final String ch3;
  final String ch4;
  final String ch5;
  Choices(this.ch1,this.ch2,this.ch3,this.ch4,this.ch5);
}


class Question with ChangeNotifier {
  final String id;
  final String img_url;
  final String question;
  bool juste_ou_faux;
  final String reponse_juste;
  final Choices choix;
  //final List<String> choix;


  Question({
    required this.id,
    required this.img_url,
    required this.question,
    required this.juste_ou_faux,
    required this.reponse_juste,
    required this.choix,
  });

  void set_juste_ou_faux(bool jf){
    juste_ou_faux = jf;
    notifyListeners();
  }
}
String ch5 = 'Passer à la question suivante';
String ch5_prime= 'Passer cette question et voir les résultats';


class Questions with ChangeNotifier {
  final List<Question> questions = [
    Question(
      id: 'q1',
      img_url: "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg",
      question: "Quel pays a remporté la coupe du monde de football en 2014 ?",
      juste_ou_faux:false,
      reponse_juste : "Allemagne",
      choix : Choices("Allemagne","Argentine","Italie","Brésil",ch5),
      //choix : ["Italie","Argentine","Allemagne","Brésil",ch5],
    ),
    Question(
      id: 'q2',
      img_url: "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-5.jpg",
      question: "Dans quelle ville italienne l'action de la pièce"
          " Shakespeare (Roméo et Juliette) se situe-elle ?",
      juste_ou_faux:false,
      reponse_juste: "Vérone",
      choix : Choices("Venise","Rome","Milan","Vérone",ch5),
    ),
    Question(
      id: 'q3',
      img_url: "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-8.jpg",
      question: "Parmi les animaux suivants, lequel peut "
          "se déplacer le plus rapidement ?",
      juste_ou_faux:false,
      reponse_juste : "springbok",
      choix : Choices("léopard","mgdobe","springbok","chevreuil",ch5),
    ),
    Question(
      id: 'q4',
      img_url: "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-2.jpg",
      question: "Qui a dit : « Le sort en est jeté » (Alea jacta est) ?",
      juste_ou_faux:false,
      reponse_juste : "César",
      choix : Choices("Attila","César","Auguste","Vercingétorix",ch5_prime),
    ),
  ];
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Questions(),
        ),
      ],
      child: MaterialApp(
        title: 'Named Routes Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/first': (context) => const MyQu1(),
          '/second': (context) => const MyQu2(),
          '/third': (context) => const MyQu3(),
          '/fourth': (context) => const MyQu4(),
          '/resultats': (context) => MyResultats(),
        },
      ),
    ),

  );
}

class QuizzAppWithProvider extends StatelessWidget {
  const QuizzAppWithProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Provider<Questions>(
        create:(_)=>Questions(),
        child :MaterialApp(
          home: HomePage(),
          theme: ThemeData(
          primarySwatch: Colors.green,//Color(0xFFAEEA00)
        ),
          title: 'Questions / Réponses',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description = "Bienvenue au Quizz. \nVous aurez 4 questions "
        "auxquelles vous pouvez répondre. \nPour chacune d'elles, vous avez "
        "4 propositions, l'une d'elle est juste. \nEn cliquant sur l'une d'elles "
        "ceci enregistrera votre réponse. \nSi vous souhaitez ne pas répondre à "
        "une question , vous pouvez cliquer sur le bouton (passer à la question "
        "suivante). \nA la fin du quizz, vous aurez le résultat. \nVous pourrez ainsi "
        "refaire le quizz si vous le souhaitez";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
        backgroundColor: Colors.green,//Color(0xFFAEEA00)
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
                  Navigator.pushNamed(context, '/first');
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
//------------------------------------------------------------------------------------------------------------------------------------------------
class MyQu1 extends StatelessWidget {
  const MyQu1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Question qu1 = Provider.of<Questions>(context).questions[0];
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: const Text("Questions / Réponses"),
          backgroundColor: Colors.green,//Color(0xFFAEEA00)
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
                      image: DecorationImage(
                          //image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg"),
                          image: NetworkImage(qu1.img_url),
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
                    qu1.question,
                    //"description",
                    style: TextStyle(
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
                          print("mauvaise réponse");
                          Navigator.pushNamed(context, '/second');
                          //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                          //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                          qu1.set_juste_ou_faux(false);
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
                              children: <Widget>[
                                Text(
                                  qu1.choix.ch1,
                                  //'Italie',
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
                          print("mauvaise réponse");
                          Navigator.pushNamed(context, '/second');
                          //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                          //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                          qu1.set_juste_ou_faux(false);
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
                              children: <Widget>[
                                Text(
                                  qu1.choix.ch2,
                                  //'Argentine',
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
                ),),
                      Container(
                        //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          print("bonne réponse");
                          Navigator.pushNamed(context, '/second');
                          //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=true;//set_juste_ou_faux(true);
                          //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(true);
                          qu1.set_juste_ou_faux(true);
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
                              children:  <Widget>[
                                Text(
                                  qu1.choix.ch3,
                                  //'Allemagne',
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
                          print("mauvaise réponse");
                          //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                          //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                          qu1.set_juste_ou_faux(false);
                          Navigator.pushNamed(context, '/second');
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
                              children: <Widget>[
                                Text(
                                  qu1.choix.ch4,
                                  //'Brésil',
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
                    print("mauvaise réponse");
                    Navigator.pushNamed(context, '/second');
                    //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                    //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                    qu1.set_juste_ou_faux(false);

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
                        children: <Widget>[
                          Text(
                            qu1.choix.ch5,
                            //'Passer à la question suivante',
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

//-------------------------------------------------------------------------------------------------------------------------------------------

class MyQu2 extends StatelessWidget {
  const MyQu2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Question qu2 = Provider.of<Questions>(context).questions[1];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
        backgroundColor: Colors.green,//Color(0xFFAEEA00)
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
                    image: DecorationImage(
                      //image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg"),
                        image: NetworkImage(qu2.img_url),
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
                  qu2.question,
                  //"description",
                  style: TextStyle(
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/third');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[1].set_juste_ou_faux(false);
                        qu2.set_juste_ou_faux(false);
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
                            children: <Widget>[
                              Text(
                                qu2.choix.ch1,
                                //'Italie',
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/third');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu2.set_juste_ou_faux(false);
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
                            children: <Widget>[
                              Text(
                                qu2.choix.ch2,
                                //'Argentine',
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/third');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=true;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(true);
                        qu2.set_juste_ou_faux(false);
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
                            children:  <Widget>[
                              Text(
                                qu2.choix.ch3,
                                //'Allemagne',
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
                        print("bonne réponse");
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu2.set_juste_ou_faux(true);
                        Navigator.pushNamed(context, '/third');
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
                            children: <Widget>[
                              Text(
                                qu2.choix.ch4,
                                //'Brésil',
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
                  print("mauvaise réponse");
                  Navigator.pushNamed(context, '/third');
                  //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                  //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                  qu2.set_juste_ou_faux(false);

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
                      children: <Widget>[
                        Text(
                          qu2.choix.ch5,
                          //'Passer à la question suivante',
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

//-------------------------------------------------------------------------------------------------------------------------------------------

class MyQu3 extends StatelessWidget {
  const MyQu3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Question qu3 = Provider.of<Questions>(context).questions[2];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
        backgroundColor: Colors.green,//Color(0xFFAEEA00)
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
                    image: DecorationImage(
                      //image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg"),
                        image: NetworkImage(qu3.img_url),
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
                  qu3.question,
                  //"description",
                  style: TextStyle(
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/fourth');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu3.set_juste_ou_faux(false);
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
                            children: <Widget>[
                              Text(
                                qu3.choix.ch1,
                                //'Italie',
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/fourth');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu3.set_juste_ou_faux(false);
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
                            children: <Widget>[
                              Text(
                                qu3.choix.ch2,
                                //'Argentine',
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
                        print("bonne réponse");
                        Navigator.pushNamed(context, '/fourth');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=true;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(true);
                        qu3.set_juste_ou_faux(true);
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
                            children:  <Widget>[
                              Text(
                                qu3.choix.ch3,
                                //'Allemagne',
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
              ),),
            Container(
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        print("mauvaise réponse");
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu3.set_juste_ou_faux(false);
                        Navigator.pushNamed(context, '/fourth');
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
                            children: <Widget>[
                              Text(
                                qu3.choix.ch4,
                                //'Brésil',
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
                  print("mauvaise réponse");
                  Navigator.pushNamed(context, '/fourth');
                  //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                  //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                  qu3.set_juste_ou_faux(false);

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
                      children: <Widget>[
                        Text(
                          qu3.choix.ch5,
                          //'Passer à la question suivante',
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

//-------------------------------------------------------------------------------------------------------------------------------------------

class MyQu4 extends StatelessWidget {
  const MyQu4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Question qu4 = Provider.of<Questions>(context).questions[3];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions / Réponses"),
        backgroundColor: Colors.green,//Color(0xFFAEEA00)
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
                    image: DecorationImage(
                      //image: NetworkImage("https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg"),
                        image: NetworkImage(qu4.img_url),
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
                  qu4.question,
                  //"description",
                  style: TextStyle(
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/resultats');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu4.set_juste_ou_faux(false);
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
                            children: <Widget>[
                              Text(
                                qu4.choix.ch1,
                                //'Italie',
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
                        print("bonne réponse");
                        Navigator.pushNamed(context, '/resultats');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu4.set_juste_ou_faux(true);
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
                            children: <Widget>[
                              Text(
                                qu4.choix.ch2,
                                //'Argentine',
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
                        print("mauvaise réponse");
                        Navigator.pushNamed(context, '/resultats');
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=true;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(true);
                        qu4.set_juste_ou_faux(false);
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
                            children:  <Widget>[
                              Text(
                                qu4.choix.ch3,
                                //'Allemagne',
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
              ),),
            Container(
              //constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        print("mauvaise réponse");
                        //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                        //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                        qu4.set_juste_ou_faux(false);
                        Navigator.pushNamed(context, '/resultats');
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
                            children: <Widget>[
                              Text(
                                qu4.choix.ch4,
                                //'Brésil',
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
                  print("mauvaise réponse");
                  Navigator.pushNamed(context, '/resultats');
                  //Provider.of<Questions>(context, listen: false).questions[0].juste_ou_faux=false;//set_juste_ou_faux(true);
                  //Provider.of<Questions>(context, listen: false).questions[0].set_juste_ou_faux(false);
                  qu4.set_juste_ou_faux(false);

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
                      children: <Widget>[
                        Text(
                          qu4.choix.ch5,
                          //'Passer à la question suivante',
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

//-------------------------------------------------------------------------------------------------------------------------------------------

class MyResultats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<Question> qus = Provider.of<Questions>(context).questions;
    String description = "Resultats : \n\n\n"
        "Question 1 : " + (qus[0].juste_ou_faux? "juste" : "faux") + "\n\n"
        "Question 2 : " + (qus[1].juste_ou_faux? "juste" : "faux") + "\n\n"
        "Question 3 : " + (qus[2].juste_ou_faux? "juste" : "faux") + "\n\n"
        "Question 4 : " + (qus[3].juste_ou_faux? "juste" : "faux") + "\n\n";
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Questions / Réponses"),
          backgroundColor: Colors.green,//Color(0xFFAEEA00)
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
                  print("-------------------------------------");
                  Navigator.pushNamed(context, '/');
                  qus[0].juste_ou_faux = false;
                  qus[1].juste_ou_faux = false;
                  qus[2].juste_ou_faux = false;
                  qus[3].juste_ou_faux = false;
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
