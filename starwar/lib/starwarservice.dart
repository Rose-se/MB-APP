import 'package:starwar/starwarlist.dart';
import 'package:starwar/starwarmodel.dart';
import 'package:starwar/starwarprovider.dart';

class StarwarService {
  StarwarProvider _starwarprovider = new StarwarProvider();
  StarwarProvider _providerdata = new StarwarProvider();

  Future<StarwarListModel> getStarwarList() {
    return _starwarprovider.getStarwarList();
  }

  Future<StarwarModel> getdata(String URL) {
    return _providerdata.getdata(URL);
  }
}
