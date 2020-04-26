import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProv{
  List<dynamic> opciones = [];

  _MenuProv(){
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async{
    //await Future.delayed(Duration(seconds:5));
    final resp = await rootBundle.loadString('data/menu_opts.json');
    
    Map dataMap = json.decode(resp);
    //sprint(dataMap['nombreApp']);
    opciones = dataMap['rutas'];
    
    return opciones;
  }
}

final menuProv = new _MenuProv();