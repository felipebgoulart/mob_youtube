import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/components/custom_search.dart';
import 'package:youtube/pages/home.dart';
import 'package:youtube/pages/library.dart';
import 'package:youtube/pages/subscriptions.dart';
import 'package:youtube/pages/what_shot.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _index = 0;
  String? search = '';
  List<Widget> _indices = [];
  
  void populateIndice() {
    _indices = [
      Home(search: search),
      WhatShot(),
      Subscriptions(),
      Library()
    ];
  }

  @override
  Widget build(BuildContext context) {
    populateIndice();
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/youtube.png',
          width: 98,
          height: 22,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search
            ),
            onPressed: () async {
              String? result = await showSearch(
                context: context,
                delegate: CustomSearch()
              );
              setState(() {
                search = result;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _indices[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: _index,
        onTap: (index) => {
          setState(() => {
            _index = index
          })
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: 'Em alta',
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            label: 'Inscrições',
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}