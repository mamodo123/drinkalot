import 'package:drinkalot/const/consts.dart';
import 'package:drinkalot/functions.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';

Widget button(String text, void Function()? onTap, double width, double height,
        {Color color = red}) =>
    GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: darkenColor(color, 0.3), width: 5),
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: width,
              height: height,
              child: Center(
                  child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white, fontFamily: font, fontSize: 30),
              ))),
        ));
