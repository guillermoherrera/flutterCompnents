import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_prov.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    
    return FutureBuilder(
      future: menuProv.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

        
        return ListView(
          children: _listaItems(snapshot.data, context),
        );

      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opc = [];
    data.forEach((opt){
      final wTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){

          /*final route = MaterialPageRoute(
            builder: (context) => AlertPage()
          );
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, opt['ruta']);

        },
      );
      opc..add(wTemp)
        ..add(Divider());
    });

    return opc;
  }
}