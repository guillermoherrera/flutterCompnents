import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Text")
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert', style: TextStyle(color: Colors.white),),
          color: Colors.blue,
          onPressed: ()=> _mostrarAlert(context),
          shape: StadiumBorder(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.pop(context);},
        child: Icon(Icons.format_align_center),
      ),
    );
  }

  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text('titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('datadatadatadatadatadata datadata data datadata'),
              FlutterLogo(size:100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=> Navigator.of(context).pop(),
              child: Text('Cerrar')
            ),
            FlatButton(
              onPressed: (){},
              child: Text('OK')
            )
          ],
        );
      }
    );
  }
}