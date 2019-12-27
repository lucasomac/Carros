import 'package:Carros/drawer_list.dart';
import 'package:Carros/pages/carro/carros_api.dart';
import 'package:Carros/pages/carro/carros_listview.dart';
import 'package:Carros/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTabs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Clássicos",
            ),
            Tab(
              text: "Esportivos",
            ),
            Tab(
              text: "Luxo",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = await Prefs.getInt("tabIdx");
    _tabController.addListener(() {
      print("Tab ${_tabController.index}");
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }
}
