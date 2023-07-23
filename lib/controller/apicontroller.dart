import 'package:flutter/material.dart';
import 'package:sky_scrapper2/controller/helpers/apihelper.dart';

class ApiController extends ChangeNotifier {
  Map? data;

  ApiController() {
    storeData();
  }

  Future<Map> storeData() async {
    ApiHelper.apiHelper.loadLocation();
    data = (await ApiHelper.apiHelper.loadLocation())!;
    notifyListeners();
    return data!;
  }

  Future<Map> searchData({String q = "surat"}) async {
    ApiHelper.apiHelper.search(search: q);
    data = (await ApiHelper.apiHelper.loadLocation())!;
    notifyListeners();
    return data!;
  }
}
