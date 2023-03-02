import 'dart:convert';
import 'package:http/http.dart';
import 'package:starwar/starwarlist.dart';
import 'package:starwar/starwarmodel.dart';

class StarwarProvider {
  Future<StarwarListModel> getStarwarList() async {
    var uri = Uri.https('swapi.dev', 'api/people/');
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      StarwarListModel pModel = StarwarListModel.fromJson(body);
      return pModel;
    } else {
      // ignore: avoid_print
      print("Can't get get response from server");
      throw "Server exception";
    }
  }

  Future<StarwarModel> getdata(String url) async {
    var lastKEY = Uri.parse(url);

    var uri = Uri.https("swapi.dev", lastKEY.path);
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      StarwarModel pModel = StarwarModel.fromJson(body);
      return pModel;
    } else {
      // ignore: avoid_print
      print("can't get response form server");
      throw "Server die";
    }
  }
}
