import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:provider_shopper/HomeScreen/form.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {



    return Scaffold(


      body: Center(
        child: buildForm(context)
      )

    );
  }
}