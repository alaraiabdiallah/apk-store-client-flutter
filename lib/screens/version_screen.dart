import 'package:apk_store_client_flutter/utils/auth.dart';
import 'package:apk_store_client_flutter/utils/str.dart';
import 'package:apk_store_client_flutter/widgets/menu_bar.dart';
import 'package:flutter/material.dart';

class VersionScreen extends StatefulWidget {
  static const routeName = "/versions";
  @override
  _VersionScreenState createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {

  @override
  void initState() {
    checkAPIKey(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBar(context, title: Text(Str.VERSION_TEXT)),
      body: Center(
        child: Text("Version Screen"),
      ),
    );
  }
}
