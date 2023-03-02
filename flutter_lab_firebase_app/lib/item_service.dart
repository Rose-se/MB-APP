import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemService {
  Future<void> addItem(
      BuildContext context, Map<String, dynamic> data, String documentName) {
    return FirebaseFirestore.instance
        .collection('item')
        .doc(documentName)
        .set(data);
  }

  Future<void> saveItem(
      BuildContext context, Map<String, dynamic> data, String documentName) {
    print(documentName);
    return FirebaseFirestore.instance
        .collection('item')
        .doc(documentName)
        .update(data);
  }

  Future<void> deleteItem(BuildContext context, String documentName) {
    return FirebaseFirestore.instance
        .collection('item')
        .doc(documentName)
        .delete();
  }

  void showMessageBox(
      BuildContext context, String titleText, String contentText,
      {required List<Widget> actions}) async {
    try {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text(titleText),
              content: Text(contentText),
              actions: actions,
            );
          });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
