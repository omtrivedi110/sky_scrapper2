import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper2/controller/helpers/apihelper.dart';

class ApiController extends ChangeNotifier {
  Map? data;
  String place = "Surat";
  bool save = false;
  List<String> bookmarklist = [];
  String listkey = "listkey";

  SharedPreferences? preferences;

  ApiController({required SharedPreferences pref}) {
    preferences = pref;
    storeData();
  }

  bookmark() {
    List? val = preferences!.getStringList(place);
    if (val != null) {
      bookmarklist.add(place);
      preferences!.setStringList(listkey, bookmarklist);
    }
    save = !save;
    notifyListeners();
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
