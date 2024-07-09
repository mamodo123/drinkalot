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
                  border: onTap == null ? null : Border.all(
                      color: darkenColor(color, 0.3),
                      width: 5),
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: width,
              height: height,
              child: Stack(
                children: [
                  Center(
                      child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: font, fontSize: 30),
                  )),
                  if (onTap == null)
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                    )
                ],
              )),
        ));
