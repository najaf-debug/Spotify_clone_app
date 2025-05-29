// ignore_for_file: unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';

class TypeChipwidget extends StatelessWidget {
  TypeChipwidget({super.key, required this.typeName});

  String typeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Center(
        child: Text(
          "$typeName",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
