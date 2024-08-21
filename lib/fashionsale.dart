import 'package:TKPH360/bagpage.dart';
import 'package:TKPH360/profilepage.dart';
import 'package:TKPH360/shoppage.dart';
import 'package:flutter/material.dart';

class FashionSalePage extends StatefulWidget {
  @override
  _FashionSalePageState createState() => _FashionSalePageState();
}

class _FashionSalePageState extends State<FashionSalePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold();
  }
}
     
