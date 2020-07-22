import 'dart:convert';

import 'package:http/http.dart' as http;

class APIServer {
  final String serverURL;
  final String apiKey;

  APIServer({this.serverURL = "http://localhost:2807", this.apiKey});

  Future<bool> verifyKey() async{
    try {
      await getVersions();
      return true;
    } catch (e) {
      return false;
    }
  }

  getVersions({String flag}) async {
    var url = "$serverURL/v1/versions/";
    if(flag != null) url += "?flag=$flag";
    var response = await http.get(url, headers: {"apikey": apiKey});
    if(response.statusCode == 403) throw Exception("API Key invalid.");
    if(response.statusCode != 200) throw Exception("Failed to retrive data.");
    return json.decode(response.body);
  }
}