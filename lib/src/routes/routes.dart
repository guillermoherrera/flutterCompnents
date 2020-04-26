import 'package:componentes/src/pages/bottom_tab_page.dart';
import 'package:componentes/src/pages/drawer_page.dart';
import 'package:componentes/src/pages/snackbar_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/List.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/steper_page.dart';
import 'package:componentes/src/pages/tap_page.dart';


Map<String, WidgetBuilder> getRoutes(){

  return <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        AvatarPage.pageName: (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
        'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
        'inputs': (BuildContext context) => InputPage(),
        'sliders': (BuildContext context) => SliderPage(),
        'lists': (BuildContext context) => ListPage(),
        'steper': (BuildContext context) => SteperPage(),
        'tabs': (BuildContext context) => TapPage(),
        'bottomtabs': (BuildContext context) => BottomTabPage(),
        'drawer': (BuildContext context) => DrawerPage(),
        'snackbar': (BuildContext context) => SnackbarPage()
      };
}

