import 'package:drinkalot/const/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const/colors.dart';
import 'screens/load_decks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: app_name,
    theme: ThemeData(
      primaryColor: red,
      primaryColorLight: background,
      primaryColorDark: darkRed,
      scaffoldBackgroundColor: background,
      appBarTheme: const AppBarTheme(
        color: background,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: red, //change your color here
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
    ),
    home: const LoadDecksScreen(),
  ));
}
