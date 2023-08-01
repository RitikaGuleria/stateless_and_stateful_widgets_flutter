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
      home: Scaffold(appBar: AppBar(title: Text("Stateless and Stateful Widgets"),),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Text("Welcome to the app!!!",style: TextStyle(fontSize: 30),),
            const SizedBox(height: 20,),
            MyHomePage(text: "Hello"),
          ],
        ),
      ),
      ),
      );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  const MyHomePage({required this.text});
  final String text;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var maleCounter=0;
  var femaleCounter=0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      child: Column(
        children: [
          Text(widget.text),
          const SizedBox(height: 20,),
          Text("No. of males: $maleCounter",style: TextStyle(fontSize: 16),),
          const SizedBox(height: 20,),
          Text("No. of females: $femaleCounter",style: TextStyle(fontSize: 16),),
          const SizedBox(height: 20,),
          MaterialButtonWidget(text: "Male +",onTap: (){

            setState(() {
              maleCounter++;
              // maleCounter++;
            });
          },),
          const SizedBox(height: 20,),
          MaterialButtonWidget(text: "female +",onTap: (){

            setState(() {
              femaleCounter++;
              // femaleCounter++;
            });
          },),
        ],
      ),
    );
  }
}

class MaterialButtonWidget extends StatelessWidget {
  //bcz of this const constructor this method will built once above in tateful widget
  // and resued multiple times.
  const MaterialButtonWidget({required this.onTap,required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onTap,height: 50,minWidth: 200,color: Colors.blue,elevation: 15,
      child: Text(text,style: const TextStyle(fontSize: 20,color: Colors.white,),),);
  }
}
