import 'package:apk_store_client_flutter/utils/auth.dart';
import 'package:apk_store_client_flutter/utils/str.dart';
import 'package:apk_store_client_flutter/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    checkAPIKey(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBar(context, title: Text(Str.HOME_TEXT)),
      body: Center(
        child: Text("Home Screen"),
      )
    );
  }
}