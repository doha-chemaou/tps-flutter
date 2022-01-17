import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FirstCard'),
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
  //int _counter = 0;

/*
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         // Expanded(
          //flex: 60,
          //child:Positioned(
          Positioned(
            top:0,
            left:0,
            bottom:0,
            right:0,

            child:Container(
              child: Center(
                child:Container(

                  decoration: BoxDecoration(
                    color: const Color(0xFFFF80AB),
                    /*image: const DecorationImage(
                        image: NetworkImage(""),
                        fit: BoxFit.cover),*/
                    border: Border.all(
                      color: Colors.black,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width:300,
                  height:200,
                  alignment: Alignment.center,
                  //child: Positioned(
                  //  top:500,
                  //left:0,
                  //right:0,
                  //bottom:0,
                  child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Abderrahmane Seriai\n'
                            'seriai.abderrahmane@gmail.com\n\n'
                            'twitter: XXXXXXXX',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                        textAlign: TextAlign.center,
                      ),
                    /*const Positioned(
                      top:-20,
                      right:0,
                      left:0,
                      bottom:30,
                      child: Text(
                        'twitter: XXXXXXXX',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),*/
                      const Positioned(
                        top:0,
                      right:0,
                      left:-150,
                      bottom:-40,

                      child: Icon(
                          Icons.accessibility_new_outlined,
                        color: Colors.white,
                      ), //child: null,
                      ),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                 // ),
                ),
                //),
              ),
            ),
          ),
        Positioned(
            top:-200,
            left:0,
            bottom:0,
            right :0,
      /*child:Container(
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
    ),*/
      child:Container(
      child: Center(
          child: Container(
            width:100,
            height:100,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFFF80AB),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(100),

              //color: const Color(0xFFFF80AB),
              image: DecorationImage(
                  image: AssetImage("assets/img2.jpg"),
//                  image: NetworkImage("http://latestwall.com/images/wallpaper/beautiful-nature-photography-hd-background-jpg"),
                //image: NetworkImage("http://latestwall.com/images/wallpaper/beautiful-nature-photography-hd-background-jpg"),
                fit: BoxFit.cover,
              ),
                  //image: NetworkImage("http://latestwall.com/images/wallpaper/beautiful-nature-photography-hd-background-jpg"),


            ),

          ),
      ),
      ),
          ),
        //  ),
      //Expanded(
          //flex: 6,
          //child:Positioned(

          ],
      ),
    );
  }
}
