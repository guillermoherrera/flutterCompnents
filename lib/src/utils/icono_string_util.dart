import 'package:flutter/material.dart';

final _icons = <String, IconData>{
    'add_alert': Icons.add_alert,
    'accessibility': Icons.accessibility,
    'folder_open': Icons.folder_open,
    'donut_large': Icons.donut_large,
    'input': Icons.input,
    'slider': Icons.tune,
    'list': Icons.list,
    'steper' : Icons.directions_walk,
    'tab': Icons.touch_app,
    'bottomtab': Icons.tab,
    'drawer': Icons.menu,
    'snackbar': Icons.message
};

Icon getIcon(String icon){
  return Icon(_icons[icon], color: Colors.blue,);
}