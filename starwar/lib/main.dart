import 'package:flutter/material.dart';
import 'package:starwar/starwardetailscreen.dart';
import 'package:starwar/starwarlist.dart';
import 'package:starwar/starwarservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starwar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  StarwarService starwarservice = StarwarService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: starwarservice.getStarwarList(),
          builder: (context, AsyncSnapshot<StarwarListModel> snapshot) {
            if (snapshot.hasData) {
              StarwarListModel lists = snapshot.data!;
              return ListView(
                children: lists.results
                    .map((StarwarListItem e) => ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => starwarDetail(
                                        title: e.name, url: e.url)));
                          },
                          title: Text(e.name),
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
