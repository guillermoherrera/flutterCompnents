import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '', _email = '', _fecha = '', _opcsel = 'volar';
  TextEditingController inputFechaCtrllr = new TextEditingController();

  List<String> _poderes = ['volar', 'correr', 'fuerza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearDate(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
  
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'data',
        labelText: 'Nombre',
        helperText: 'Solo nombre',
        suffix: Icon(Icons.account_circle),
        icon: Icon(Icons.accessibility),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (value){
        setState(() {
          _nombre = value;  
        });
        print(_nombre);
      },
    );
  
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('$_nombre'),
      subtitle: Text('$_email'),
      trailing: Text('$_opcsel'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counter: Text('Letras ${_email.length}'),
        hintText: 'data',
        labelText: 'Email',
        helperText: 'Solo email',
        suffix: Icon(Icons.email),
        icon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (value){
        setState(() {
          _email = value;  
        });
        print(_email);
      },
    );
  }

  Widget _crearPass() {
    return TextField(
      //keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        counter: Text('Letras ${_email.length}'),
        hintText: 'data',
        labelText: 'Pass',
        helperText: 'Solo pass',
        suffix: Icon(Icons.lock),
        icon: Icon(Icons.lock_open),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (value){
        setState(() {
          _email = value;  
        });
        print(_email);
      },
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      controller: inputFechaCtrllr,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        counter: Text('Letras ${_fecha.length}'),
        hintText: 'data',
        labelText: 'Fecha',
        helperText: 'Solo fecha',
        suffix: Icon(Icons.date_range),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(2021),
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        inputFechaCtrllr.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> opcionesD(){

    List<DropdownMenuItem<String>> list = new List();
    _poderes.forEach((poder){
      list.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return list;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(),
        Expanded(
          child: DropdownButton(
            value: _opcsel,
            items: opcionesD(),
            onChanged: (opt){
              setState(() {
                _opcsel = opt;
              });
            }
          ),
        ),
      ],
    );
  }
}