import 'package:flutter/material.dart';
import 'package:flutter_lab_firebase/item_service.dart';

class NewItemScreen extends StatefulWidget {
  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {

  final itemNameController = TextEditingController();
  final itemDescriptionController = TextEditingController();

  final ItemService iService = ItemService();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Item"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: "Item Name"),
                      controller: itemNameController,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Item Description"),
                      controller: itemDescriptionController,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    ElevatedButton(
                    child: const Text("Add items"),
                    onPressed: () {
                    if (itemNameController.text == "" ||
                    itemDescriptionController.text == "") {
                    } else {
                     iService.addItem(context,
                    {
                     "name": itemNameController.text,
                     "description": itemDescriptionController.text},itemNameController.text);
                      itemNameController.text = "";
                     itemDescriptionController.text = "";}},)
                    ],
                ),
              ),
            ],
          )),
        ));
  }
}