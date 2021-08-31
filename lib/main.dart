import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/bloc/states_cubit.dart';
import 'package:news_app/dio/dio_helpers.dart';
import 'package:news_app/screens/search.dart';

import 'bottom_navigition_bar/navigition_bar.dart';

void main() {
  dio_helpers.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red,
          primaryIconTheme: IconThemeData(color: Colors.red),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.red),
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            actionsIconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            color: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 20,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: IconThemeData(
                color: Colors.red,
              ),
              unselectedIconTheme: IconThemeData(color: Colors.blueGrey)),
          scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(
          primaryColor: Colors.red,
          primaryIconTheme: IconThemeData(color: Colors.red),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.red),
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black87,
                statusBarIconBrightness: Brightness.light),
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            color: Colors.black87,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 20,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: IconThemeData(
                color: Colors.red,
              ),
              unselectedIconTheme: IconThemeData(color: Colors.blueGrey) ,

          backgroundColor:  Colors.grey

          ),
          scaffoldBackgroundColor: Colors.black38),
      themeMode:ThemeMode.light,
      home: navigtionbar(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //
      //   "search": (conrext) =>settings() ,
      // },
    );
  }
}
