import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widgets/compnents.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/screens/Business.dart';
import 'package:news_app/screens/Sience.dart';
import 'package:news_app/screens/Sport.dart';
import 'package:news_app/screens/search.dart';
import 'package:news_app/dio/dio_helpers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class states_cubit extends Cubit<states> {
  states_cubit() : super(initialized_state());

  static states_cubit get(context) => BlocProvider.of(context);

  int botoom_index = 0;

  List bottom_nav_screens = [business(), spoert(), science(), search()];
  List mybusiness = [];
  List mysport = [];
  List myscience = [];

  bool isdark = false;
  String wordsearched = "";
  List listsearch = [];

  void change_bootm_nav(int index) {
    botoom_index = index;
    emit(change_botoom_nav_state());
  }

  List<BottomNavigationBarItem> bottom_items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  void getBussiness() {
    emit(waitingBusinessSuccessState());
    dio_helpers.get_data(url: "/v2/top-headlines", query: {
      "country": "eg",
      "catagory": "business",
      "apiKey": "6f7e5ebaaf2243de8bbff34dfecc0a24",
    }).then((value) async {
      mybusiness = await value.data["articles"];
      print(mybusiness);

      emit(NewgGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSport() {
    emit(waitingSportSuccessState());

    dio_helpers.get_data(url: "/v2/top-headlines", query: {
      "country": "us",
      "catagory": "sport",
      "apiKey": "6f7e5ebaaf2243de8bbff34dfecc0a24"
    }).then((value) async {
      mysport = await value.data["articles"];
      print(mysport);
      emit(NewgGetSportSuccessState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void getScience() {
    emit(waitingBusinessSuccessState());
    dio_helpers.get_data(url: "/v2/top-headlines", query: {
      "sources": "bbc-news",
      "catagory": "science",
      "apiKey": "6f7e5ebaaf2243de8bbff34dfecc0a24",
    }).then((value) async {
      myscience = await value.data["articles"];
      print(myscience);

      emit(NewgGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  // void getScience() {
  //   emit(waitingScienceSuccessState());
  //   dio_helpers.get_data(url: "/v2/top-headlines", query: {
  //     "country": "eg",
  //     "catagory": "science",
  //     "apiKey": "6f7e5ebaaf2243de8bbff34dfecc0a24"
  //   }).then((value) async {
  //     myscience = await value.data["articles"];
  //     print(myscience);
  //     emit(NewgGetScienceSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }

  void changethememode(bool theme) {
    theme = !theme;
    theme == true ? ThemeMode.dark : ThemeMode.light;
    emit(statelightanddarkmode());
  }

  void gotoutl(Map my, String txt) {
    WebView(
      initialUrl: my["url"],
    );
    emit(gotourl());
  }

  void wordsearch(String word, context) {

    emit(witingsearchwordstat()) ;
    dio_helpers.get_data(url: "/v2/everything", query: {
      "q": "$word",
      "apiKey": "6f7e5ebaaf2243de8bbff34dfecc0a24",
    }).then((value) {

      listsearch= value.data["articles"] ;
      emit(successearchwordstat()) ;

    }).catchError((error){

      print (error.toString()) ;
      emit(erroesearchwordstat()) ;


    });

  }
}
