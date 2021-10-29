// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categories = [
    "Rozet",
    "Anahtarlık",
    "Magnet",
    "Çift Ürünleri",
    "Özel İstek",
    "Valorant",
    "Harry Potter",
    "Naruto",
    "Squid Game",
    "Memes",
    "Rick and Morty",
    "K-Pop",
    "Death Note",
    "Sword Art Online",
  ];

  static const _url = 'https://www.shopier.com/ShowProductNew/products.php?id=9179184&sid=NHhpNWZCNW5zS0dLR0xnajBfMF9Sb3pldF8g';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 14,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(Icons.person_outline),
            title: Text(
              'DASHBOARD',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(child: Text("Venom Stuff")),
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    indicator: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(30))),
                    indicatorColor: Colors.white,
                    tabs: _buildTabList(),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: TabBarView(
                    children: List.generate(
                      14,
                      (index) => Container(
                        child: Center(
                          child: GestureDetector(
                            onTap: () => _launchURL(),
                            child: Image.asset("assets/vs1.png"),
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Tab> _buildTabList() {
    List<Tab> _tabList = [];
    for (var i = 0; i < categories.length; i++) {
      _tabList.add(
        Tab(
          child: SizedBox(
            child: Center(child: Text(categories[i], style: TextStyle(color: Colors.black))),
            width: 100,
          ),
        ),
      );
    }
    return _tabList;
  }
  
  void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
