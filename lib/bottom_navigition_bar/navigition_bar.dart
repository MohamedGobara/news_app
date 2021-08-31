import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/bloc/states_cubit.dart';
import 'package:news_app/dio/dio_helpers.dart';
import 'package:news_app/screens/search.dart';

class navigtionbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => states_cubit()
          ..getBussiness()
          ..getScience()
          ..getSport(),
        child: BlocConsumer<states_cubit, states>(
          listener: (context, states) {},
          builder: (context, states) {
            var cubit = states_cubit.get(context);
            bool thememode = true;
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.search_outlined),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => search()));
                    },
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text(
                  //         "switch Mode",
                  //         style: TextStyle(fontWeight: FontWeight.bold),
                  //       ),
                  //       IconButton(
                  //         onPressed: () {
                  //           cubit.changethememode(cubit.isdark);
                  //         },
                  //         icon: Icon(Icons.wb_sunny_outlined),
                  //
                  //         // value: cubit.isdark,
                  //         // onChanged: (bool theme) {
                  //         //   cubit.changethememode(cubit.isdark);
                  //         //     ThemeMode.light ;
                  //         // },
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
                title: Text(
                  "News",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: cubit.bottom_nav_screens[cubit.botoom_index],
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottom_items,
                iconSize: 25,
                selectedFontSize: 18,
                unselectedFontSize: 14,
                currentIndex: states_cubit.get(context).botoom_index,
                onTap: (index) {
                  cubit.change_bootm_nav(index);
                },
                elevation: 45,
              ),
            );
          },
        ));
  }
}
