import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  // lat and lon url
  String url =
      "http://api.openweathermap.org/geo/1.0/direct?q=surat&appid=6567c4d498ab31efee18ec494d0fbe7c";

  //weather url
  //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

  //Api key
  //6567c4d498ab31efee18ec494d0fbe7c

  search({required String search}) {
    url =
        "http://api.openweathermap.org/geo/1.0/direct?q=$search&appid=6567c4d498ab31efee18ec494d0fbe7c";
  }

  Future<List?> loadDefault() async {
    print("==============================");
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    print("============${response.statusCode}");
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print("==============================");
      print("Lat & Lon");
      print("==============================");
      return data;
    } else {
      print("++++++++++++++++++++++++++++");
    }
  }

  Future<Map?> loadLocation() async {
    List? data = await loadDefault();
    print("======================${data![0]['lat']}=========${data[0]['lon']}");
    http.Response response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${data[0]['lat']}&lon=${data[0]['lon']}&appid=6567c4d498ab31efee18ec494d0fbe7c",
      ),
    );
    if (response.statusCode == 200) {
      Map locdata = jsonDecode(response.body);
      print("==============================");
      print("${locdata['base']}");
      print("==============================");
      return locdata;
    } else {
      print("++++++++++++++++++++++");
    }
  }
}
