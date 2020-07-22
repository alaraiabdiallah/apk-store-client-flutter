import 'package:apk_store_client_flutter/utils/auth.dart';
import 'package:apk_store_client_flutter/utils/str.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

MenuBarActions(BuildContext context){
  _onLoggedOutPressed() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Str.APIKEY_PREFS);
    checkAPIKey(context);
  }

  var routeName = ModalRoute.of(context).settings.name;

  return [
    FlatButton(
      onPressed: routeName != '/' ? (){
        Navigator.of(context).pushReplacementNamed('/');
      } : null,
      child: Text(Str.HOME_TEXT, style: TextStyle(color: Colors.white),),
    ),
    FlatButton(
      onPressed: routeName != '/versions' ? (){
        Navigator.of(context).pushReplacementNamed('/versions');
      } : null,
      child: Text(Str.VERSION_TEXT, style: TextStyle(color: Colors.white),),
    ),

    IconButton(icon: Icon(Icons.power_settings_new), onPressed: _onLoggedOutPressed,)
  ];
}

MenuBar(BuildContext context, {Widget title}){
  return AppBar(
    automaticallyImplyLeading: false,
    title: title,
    actions: MenuBarActions(context),
  );
}

