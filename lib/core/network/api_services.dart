import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> post(String url) async {
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YjQ2MDYzMGI5ODI4YzBhNzQ5YzRmZDI4NDhkMWQ1NiIsIm5iZiI6MTcyOTgxNzg1NS44MTU4MTIsInN1YiI6IjY2M2QyNGM4MDRkYzVmMWEwYjFmMDZiNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.thwG748peVW2kEL03_kNB_Lf1YsI-_qWep3cwBK9Rs0'
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json);
      return json;
    }
  }
}
