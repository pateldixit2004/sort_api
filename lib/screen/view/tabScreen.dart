import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello world Dixit"),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 0),
            child: TabBar(
              labelPadding: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 30),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text("First Screen is THis"),
                ),
                Tab(
                  child: Text("Second Screen is THis"),
                ),
                Tab(
                  child: Text("Third Screen is THis"),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Text("First"),
            Text("Second"),
            Text("Third"),
          ],
        ),
      ),
    ));
  }
}
