import 'package:cloud_firestore/cloud_firestore.dart';
List liste = [];
List liste_ = [];
List resultats_ = [];
String description = "";
class DB {

  static Future<void> addsQuestion(String id, String i, String q, String c1,
      String c2, String c3, String c4, String b_n){
    CollectionReference ref = FirebaseFirestore.instance.collection(
        "questions");
    return
      ref.doc(id).set({
        'image_url': i,
        'question': q,
        'choix 1': c1,
        'choix 2': c2,
        'choix 3': c3,
        'choix 4': c4,
        'bonne réponse': b_n,
        'réponse choisie': "",
      }).then((value) => print(" filling database : question Added"))
          .catchError((error) => print("Question not added: $error"));
  }
  static void fillingDB() {
    addsQuestion(
      "coupe du monde 2014",
      "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-4.jpg",
      "Quel pays a remporté la coupe du monde de football en 2014 ?",
      "Italie",
      "Argentine",
      "Allemagne",
      "Brésil",
      "Allemagne",
    );

    addsQuestion(
      "roméo et juliette",
      "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-5.jpg",
      "Dans quelle ville italienne l'action de la pièce Shakespeare (Roméo et Juliette) se situe-elle ?",
      "Venise",
      "Rome",
      "Milan",
      "Vérone",
      "Vérone",
    );

    addsQuestion(
      "animal rapide",
      "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-8.jpg",
      "Parmi les animaux suivants, lequel peut se déplacer le plus rapidement ?",
      "léopard",
      "mgdobe",
      "springbok",
      "chevreuil",
      "springbok",
    );

    addsQuestion(
      "Alea jacta",
      "https://www.laculturegenerale.com/wp-content/uploads/2019/12/quiz-culture-generale-debutant-2.jpg",
      "Qui a dit : « Le sort en est jeté » (Alea jacta est) ?",
      "Attila",
      "César",
      "Vertingétorix",
      "Auguste",
      "César",
    );
  }
  dynamic data;
  Future<dynamic> getData(String id) async {
    final data = await FirebaseFirestore.instance.collection("questions").doc(id).get(); //get the data;
    return data;
  }
  static Future<List> getCloudFirestoreQuestions() async {
    final firestoreInstance = FirebaseFirestore.instance;
    List l = [];
    liste_ = [];
    firestoreInstance.collection("questions").get().then((querySnapshot) {
      querySnapshot.docs.forEach((value) {
        l.add(value.data()); //(value.data());
        liste_.add(value.id);
      });
    }).catchError((onError) {
    });
    return l;
  }
  static Future<void> meth() async {
    liste = await getCloudFirestoreQuestions();

  }


  static Future<List> resultatss() async {
    if (resultats_.isEmpty){
      for (int i = 0 ; i < liste.length ; i++){
        resultats_.add("fausse");
      }
    }

    int k = 0;
    final firestoreInstance = await FirebaseFirestore.instance;
    firestoreInstance.collection("questions").get().then((querySnapshot) {
      querySnapshot.docs.forEach((value) {
        String bonne_reponse = value.data()["bonne réponse"];
        String reponse_choisie = value.data()["réponse choisie"];
        resultats_[k] =  (bonne_reponse==reponse_choisie)? "juste" : "fausse" ;
        k++;
      });
    }).catchError((onError) {
    }) ;

    return resultats_;
  }

  static void description_(){
    int nombre_bonne_reponses = 0;
    resultatss();
    description = "";
    description+="\n\n";
    int i = 0;
    for(i = 0 ; i < liste.length ; i++){
      int k = i + 1;
      if(resultats_[i] == "juste")
        nombre_bonne_reponses++;
      description += "      Question " + k.toString() + " : " + resultats_[i] + "\n\n\n";
    }
    description+= "\t\t bonnes réponses : "+nombre_bonne_reponses.toString() + " / " + i.toString() + "\n\n\n";

  }
}
