import 'package:flutter/material.dart';
import 'package:starwar/starwarmodel.dart';
import 'package:starwar/starwarservice.dart';

class starwarDetail extends StatelessWidget {
  starwarDetail({required this.title, required this.url});
  String title;
  String url;
  StarwarService starwarService = StarwarService();
  String style = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: FutureBuilder(
        future: starwarService.getdata(url),
        builder: (context, AsyncSnapshot<StarwarModel> snapshot) {
          if (snapshot.hasData) {
            StarwarModel data = snapshot.data!;
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ${data.name}",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold)),
                    Text("Gender: ${data.gender}"),
                    Text("Height: ${data.height}"),
                    Text("Hair: ${data.hairColor}"),
                  ],
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
