import 'dart:convert';

import 'package:gallery/keys.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  const NetworkHelper();

  final String url = 'https://api.unsplash.com/photos/?client_id=$apiKey';
  final String url2 = 'https://api.unsplash.com/photos/?client_id=$apiKey2';

  Future getData() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final String data = response.body;
      return jsonDecode(data);
    } else {
      response = await http.get(Uri.parse(url2));
      if (response.statusCode == 200) {
        final String data = response.body;
        return jsonDecode(data);
      } else {
        print('error connect');
        return '';
      }
    }
  }
}
