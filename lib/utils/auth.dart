import 'package:apk_store_client_flutter/data_sources/api_server.dart';
import 'package:apk_store_client_flutter/utils/str.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void checkAPIKey(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String apikey = prefs.getString(Str.APIKEY_PREFS);
  APIServer api = APIServer(apiKey: apikey);
  if(apikey == null || !(await api.verifyKey())) Navigator.of(context).pushReplacementNamed('/login');
}