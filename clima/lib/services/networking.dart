import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
