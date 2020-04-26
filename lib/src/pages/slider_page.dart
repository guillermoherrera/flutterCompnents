import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double valslider = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider')
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(top:50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheck(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño',
      //divisions: 20,
      value: valslider,
      min: 10.0,
      max: 400.0,
      onChanged: _blockCheck ? null : (val){
        setState(() {
          valslider = val;  
        });
      }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/0/02/Singer-bon-scott-star-smile-photos-tattoos.jpg'),
      width: valslider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheck() {
    /*return Checkbox(
      value: _blockCheck,
      onChanged: (val){
        setState(() {
          _blockCheck = val;
        });
      }
    );*/
    return CheckboxListTile(
      title: Text('data'),
      value: _blockCheck,
      onChanged: (val){
        setState(() {
          _blockCheck = val;
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('data'),
      value: _blockCheck,
      onChanged: (val){
        setState(() {
          _blockCheck = val;
        });
      }
    );
  }
}