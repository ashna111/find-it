import 'package:flutter/material.dart';
import 'form.dart';
import 'internship.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new AllInternships(), //refers to internship.dart
          new AddInternship(), //refers to form.dart
        ],
        controller: tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              child: new Icon(Icons.school),
            ),
            new Tab(
              child: new Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
