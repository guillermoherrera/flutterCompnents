
import 'package:flutter/material.dart';
import 'dart:async';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> numeros = new List();
  int ultimo = 0;
  bool isLoading = false;

  ScrollController _scrollController = new ScrollController();


  @override
  void initState() {
    super.initState();

    agregarDiez();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //agregarDiez();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista')
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ) 
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: numeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = numeros[index];
          return FadeInImage(
            placeholder:  AssetImage('assets/jar_loading.gif'),
            image: NetworkImage('https://i.picsum.photos/id/$imagen/500/200.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          );
        }
      ),
    );
  }

  Future obtenerPagina()async{
    final duration = Duration(seconds: 2);

    new Timer(duration, (){
      numeros.clear();
      ultimo++;
      agregarDiez();
    });

    return Future.delayed(duration);
  }

  void agregarDiez(){
    for (var i = 1; i < 10; i++) {
      ultimo++;
      numeros.add(ultimo);
    }
    setState(() {});
  }

  Future fetchData() async{
    isLoading = true;
    setState(() {});

    final duracion = new Duration(seconds:2);


    return new Timer(
      duracion,
      respuestaHTTP
    );
  }

  void respuestaHTTP(){
    isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.bounceIn
    );
    agregarDiez();
  }

  Widget _crearLoading() {
    if(isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else{
      return Container();
    }
  }
}