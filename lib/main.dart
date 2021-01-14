import 'package:flutter/material.dart';
import 'package:provider_shopper/HomeScreen/form.dart';
import 'package:provider_shopper/secondScreen/catalog_widget.dart';

import 'HomeScreen/home_screen.dart';

void main() {
  runApp(MyApp());
}
  class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),

        title: "Shopper app",
        home:HomeScreen() ,//CatalogWidget(),
        //HomeScreen(),
      );
    }
  }
