import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // Constructor for MaterialApp

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var isChecked = false;
  late TextEditingController _controller; // late means initialize later, but not null
  late TextEditingController _controller2;

  @override
  void initState() {
    // initialize object, onloaded in HTML
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() { //unloading the page
    super.dispose();
    _controller.dispose(); //delete memory of _controller
    _controller2.dispose();
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer( child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Text("More items:"),
        Text("More items 2:"),
        Text("More items 3:"),
        Text("More items 4:"),
        Text("More items 5:"),
        Text("More items 6:"),
      ],)
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("My app is great!"),

        actions: [
          ElevatedButton(onPressed: (){   }, child: Text("Delete")) ,
        SizedBox(width:350, height:50),
        ElevatedButton(onPressed: (){}, child: Image.asset("images/algonquin.jpg", height:50, width: 50,),),

          ElevatedButton(onPressed: (){   }, child: Text("Delete 2")) ,
          ElevatedButton(onPressed: (){   }, child: Text("Delete")) ,
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (whichItem) {
          var selected = whichItem;

        },
        items: [
        BottomNavigationBarItem(icon: Icon( Icons.add_circle ) , label:"Add"  ),
        BottomNavigationBarItem(icon: Icon( Icons.add_card ), label:"Pay now"   ),
        BottomNavigationBarItem(icon: Icon( Icons.add_a_photo ), label:"Take picture"   ),


      ],  ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(onPressed: () { }, child:Text("Button 1")),
            ElevatedButton(onPressed: () { }, child:Text("Button 2")),
            ElevatedButton(onPressed: () { }, child:Text("Button 3")),
            ElevatedButton(onPressed: () { }, child:Text("Button 4")),
            Image.asset("images/algonquin.jpg", width: 100, height:100)

          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

void changeCheckbox(bool ? ch) {
  if (ch != null) {
    setState(() {
      isChecked = ch;
    });
  }
}
  void buttonClicked(){

  }
}
