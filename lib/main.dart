import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Click on the button below:', style: TextStyle(fontSize:20.0), ),
            ElevatedButton( onPressed:buttonClicked, child:  Text("Click here")  )
          ],
        ),
      ),
    );
  }

  //This function gets run when you click the button
  void buttonClicked(){

    showDialog<String>(
      context: context,
        builder:(BuildContext ctx )=> AlertDialog(
          title: const Text('This is my title'),
          content: const Text('You have a nice alert dialog'),
          actions: <Widget>[
            ElevatedButton(child: Text("Ok"),      onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text('Yay! A SnackBar!') ) ); }
              ,),
            FilledButton(  child: Text("Cancel"),  onPressed: () {  }, ),
            OutlinedButton(child: Text("Delete"),      onPressed: () {  },)

          ],
        ),
    );
  }


}
