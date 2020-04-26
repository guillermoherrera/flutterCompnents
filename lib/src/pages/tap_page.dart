import 'package:flutter/material.dart';

import 'package:componentes/src/pages/tap_page1.dart';
import 'package:componentes/src/pages/tap_page2.dart';
import 'package:componentes/src/pages/tap_page3.dart';

class TapPage extends StatefulWidget {
  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _createTabs()
        ),
      ),
      body: _createTabView(),
    );
  }

  List<Widget> _createTabs() {
    return [
      Tab(
        icon: Icon(Icons.home)
      ),
      Tab(
        icon: Icon(Icons.ondemand_video)
      ),
      Tab(
        icon: Icon(Icons.contacts)
      )
    ];
  }

  Widget _createTabView() {
    return TabBarView(
      children: [
        TapPage1(),
        TapPage2(),
        TapPage3()
      ],
      controller: _tabController,
    );
  }
}