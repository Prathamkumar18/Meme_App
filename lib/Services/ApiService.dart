import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<String>? fetchNewMeme() async {
    var url = "https://meme-api.com/gimme";
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      return data["url"];
    } else {
      throw ("Can't get the article!");
    }
  }
}
