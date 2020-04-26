import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: _createDrawer(),
    );
  }

  Widget _createDrawer() {
    return Drawer(
      child: Column(
        children: _drawerOptions(),
      )
    );
  }

  List<Widget> _drawerOptions(){
    return [
      UserAccountsDrawerHeader(
        accountName: Text('user'),
        accountEmail: Text('email'),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person),
        ),
      ),
      ListTile(
        title: Text('Opcion 1'),
        subtitle: Text('data'),
        leading: Icon(Icons.home, color: Colors.blue,),
        trailing: Icon(Icons.navigate_next),
        onTap: ()=>Navigator.pop(context),
      ),
      ListTile(
        title: Text('Opcion 2'),
        leading: Icon(Icons.settings, color: Colors.blue,),
        trailing: Icon(Icons.navigate_next),
        onTap: ()=>Navigator.pop(context),
      ),
      ListTile(
        title: Text('Opcion 3'),
        subtitle: Text('data'),
        leading: Icon(Icons.search, color: Colors.blue,),
        trailing: Icon(Icons.navigate_next),
        onTap: ()=>Navigator.pop(context),
      )
    ];
  }
}