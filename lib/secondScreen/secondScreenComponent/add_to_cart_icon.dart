import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconBuilder(bool isSaved) {

 return isSaved
      ? Icon(CupertinoIcons.check_mark,size: 30,)
      : Text(
          "Add".toUpperCase(),
        style: TextStyle(
         fontSize: 16,
         fontWeight: FontWeight.bold
        ),);

}
