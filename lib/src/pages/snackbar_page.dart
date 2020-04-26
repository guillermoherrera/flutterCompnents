import 'package:flutter/material.dart';

class SnackbarPage extends StatefulWidget {
  @override
  _SnackbarPageState createState() => _SnackbarPageState();
}

class _SnackbarPageState extends State<SnackbarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('SnackBar'),
      ),
      body: createButton(),
    );
  }

  Widget createButton() {
    return Center(
      child: RaisedButton(
        child: Text('SnackBar'),
        onPressed: (){
          _scaffoldKey.currentState.showSnackBar(_showSnackbar(texto: 'Hola soy un snackBar', duration: 5, action: true));
        }
      ),
    );
  }

  Widget _showSnackbar({String texto, int duration, bool action}) {
    return SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duration),
      action: !action ? null : SnackBarAction(
        label: 'click',
        onPressed: (){
          _scaffoldKey.currentState.showSnackBar(_showSnackbar(texto: 'Hola de nuevo', duration: 5, action: false));
        }, 
      ),
    );
  }
}