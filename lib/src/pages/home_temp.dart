import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones =['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(
          children: _crearCorto()
        ),
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = List<Widget>();

    for (String item in opciones) {
      final tempWid = ListTile(
        title: Text(item),
      );

      lista..add(tempWid)
        ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearCorto(){
    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item+'!'),
            subtitle: Text('data subtitle'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }

}