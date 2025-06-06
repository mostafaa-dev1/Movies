import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> post(String url) async {
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization':
            'Bearer ***********************************************'
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json);
      return json;
    }
  }
}
