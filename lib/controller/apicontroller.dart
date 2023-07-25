import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper2/controller/helpers/apihelper.dart';
import 'package:sky_scrapper2/modals/apimodals.dart';

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

  List get getlists {
    return preferences!.getStringList(listkey) ?? [];
  }

  bookmark() {
    List? val = preferences!.getStringList(listkey);
    if (val == null) {
      bookmarklist.add(place);
      preferences!.setStringList(listkey, bookmarklist);
    } else if (!val.contains(place)) {
      val.add(place);
      bookmarklist = List.from(val);
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
