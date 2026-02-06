import 'package:cara_ou_coroa/home.dart';
import 'package:cara_ou_coroa/theme/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      //coloca cor de fundo no scaffold do app, ou seja, a cor de fundo da tela
      theme: ThemeData(scaffoldBackgroundColor: AppColors.blueBaby),
    ),
  );
}
