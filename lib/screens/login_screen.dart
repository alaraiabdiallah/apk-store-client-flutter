import 'package:apk_store_client_flutter/data_sources/api_server.dart';
import 'package:apk_store_client_flutter/utils/str.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _apiKeyCtrl = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _canSubmit = false;
  bool _onLoading = false;

  _setLoading(){
    setState(() {
      _canSubmit = false;
      _onLoading = true;
    });
  }

  _unsetLoading(){
    setState(() {
      _canSubmit = true;
      _onLoading = false;
    });
  }

  _onSubmit() async {
    try{
      _setLoading();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var api = APIServer(apiKey: _apiKeyCtrl.text);
      bool isVerified = await api.verifyKey();
      if(!isVerified) throw Exception("Failed to enter the app.");
      _unsetLoading();
      prefs.setString(Str.APIKEY_PREFS, _apiKeyCtrl.text);
      Navigator.of(context).pushReplacementNamed('/');
    } catch(e) {
      _unsetLoading();
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.toString()),));
    }
  }
  
  _onAPIKeyFieldChanged(String text){
      setState(() => _canSubmit = text.length > 0 ? true: false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Str.APIKEY_TEXT_INSTRU, style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _apiKeyCtrl,
                onChanged: _onAPIKeyFieldChanged,
                decoration: InputDecoration(
                  hintText: Str.APIKEY_INPUT_HINT,
                  labelText: Str.APIKEY_TEXT_LABEL,
                  border: OutlineInputBorder()
                ), 
              )
            ),
            RaisedButton(
              onPressed: _canSubmit ? _onSubmit : null,
              color: Theme.of(context).primaryColor,
              child: _onLoading ? CircularProgressIndicator() : Text(Str.SUBMIT_TEXT, style: TextStyle(color: Colors.white)),
            )
          ],
        )
      ),
    );
  }
}