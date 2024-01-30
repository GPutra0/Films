import 'package:aktivitas_1/page1.dart';
import 'package:aktivitas_1/page2.dart';
import 'package:aktivitas_1/profile.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  
  int _selectIndex = 0;

  List<Widget> _screenList = [
    page1(),
    page2(),
    profile(),
  ];

  void pergantianScreen(int index){
    setState(() {
      _selectIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: pergantianScreen,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: 'Home'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie), 
          label: 'Movie'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance), 
          label: 'Account'
          ),
      ],
      ),
    );
  }
}