import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First Flutter App"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Card(
              context: context,
              color: Colors.red,
              blocktext: "633410080-1 นายนครินทร์ ตรีศรี",
              image: "lib/asset/image/Avatar_Pure_White_Core.webp"),
          Card(
              context: context,
              color: Color.fromARGB(255, 0, 255, 242),
              blocktext: "633410022-5นายพรหมพิริยะ พสุชาธัญภัทร์",
              image: "lib/asset/image/Avatar_Ruby_T_Pose.webp"),
          Card(
              context: context,
              color: Color.fromARGB(255, 95, 104, 233),
              blocktext: "633410037-2 นายอนุสรณ์ สังข์งาม",
              image: "lib/asset/image/Avatar_Lyra_T_Pose.webp"),
          Card(
              context: context,
              color: Color.fromARGB(255, 154, 247, 4),
              blocktext: "633410075-4 นางสาวจันทร์สุดา คณะวาปี",
              image: "lib/asset/image/Avatar_Lin_T_Pose.webp"),
        ],
      ),
    );
  }

  Widget Card(
      {required BuildContext context,
      required Color color,
      required String blocktext,
      required String image}) {
    return Container(
      width: 250,
      color: Colors.black12,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(name: blocktext)));
        },
        child: Column(
          children: [
            Image.network(image),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                //margin: EdgeInsets.all(10),
                color: color,
                child: Text(blocktext)),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App"),
        ),
        body: Center(
          child: Text(name),
        ));
  }
}
