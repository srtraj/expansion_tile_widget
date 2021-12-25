import 'package:expansion_tile_widget/expansion_tile_widget.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
      child: CustomExpansionTileWidget(
        headerTitle: "Overview",
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.green,
            ),
            child: const Center(
              child: Text("List1"),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.red,
            ),
            child: const Center(
              child: Text("List2"),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.blueAccent,
            ),
            child: const Center(
              child: Text("List3"),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.orangeAccent,
            ),
            child: const Center(
              child: Text("List4"),
            ),
          ),
        ],
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
