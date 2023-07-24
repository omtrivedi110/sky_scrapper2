import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String url =
      "http://api.openweathermap.org/geo/1.0/direct?q=surat&appid=6567c4d498ab31efee18ec494d0fbe7c";

  search({required String search}) {
    url =
        "http://api.openweathermap.org/geo/1.0/direct?q=$search&appid=6567c4d498ab31efee18ec494d0fbe7c";
  }

  Future<List?> loadDefault() async {
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data;
    }
  }

  Future<Map?> loadLocation() async {
    List? data = await loadDefault();
    http.Response response = await http.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${data![0]['lat']}&lon=${data[0]['lon']}&appid=6567c4d498ab31efee18ec494d0fbe7c",
      ),
    );
    if (response.statusCode == 200) {
      Map locdata = jsonDecode(response.body);
      return locdata;
    }
  }
}
