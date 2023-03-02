// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';

import 'item_service.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.name, required this.description});
  final String name;
  final String description;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final Service = ItemService();
  final itemname = TextEditingController();
  final itemdescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    itemname.text = widget.name;
    itemdescription.text = widget.description;
    final NameSend = widget.name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit item"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(20)),
                    TextField(
                        decoration: InputDecoration(
                          label: Text("Name"),
                        ),
                        controller: itemname),
                    Padding(padding: EdgeInsets.all(20)),
                    TextField(
                        decoration: InputDecoration(
                          label: Text("Description"),
                        ),
                        controller: itemdescription),
                    Padding(padding: EdgeInsets.all(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ElevatedButton(
                            onPressed: () => _edit(context, ID: NameSend),
                            child: Text("Edit")),
                        ElevatedButton(
                            onPressed: () => _delete(context, ID: NameSend),
                            child: Text("Delete"))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _edit(BuildContext context, {required ID}) {
    // print(ID);
    Service.saveItem(context,
        {"name": itemname.text, "description": itemdescription.text}, ID);
  }

  void _delete(BuildContext context, {required ID}) {
    // print(ID);
    Service.deleteItem(context, ID);
  }
}
