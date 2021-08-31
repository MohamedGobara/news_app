import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widgets/compnents.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/bloc/states_cubit.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => states_cubit(),
      child: BlocConsumer<states_cubit, states>(
          builder: (states, context) {
            //  var cubit = states_cubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                body: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Search",
                        prefix: Icon(Icons.search_outlined),
                        hintText: "Enter you words",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return "must not me embty";
                      },
                      onChanged: (val) {
                        states_cubit.get(context).wordsearch(val, context);
                      },
                    ),
                    SizedBox(
                      height: 17,
                    ),

                    // ListView.separated(
                    //     physics: BouncingScrollPhysics(),
                    //     separatorBuilder: (context, index) {
                    //       return const Divider(
                    //         color: Colors.indigo,
                    //         height: 0.7,
                    //       );
                    //     },
                    //     itemBuilder: (context, index) {
                    //       return businesswidget(
                    //           states_cubit.get(context).mybusiness[index], context);
                    //     },
                    //     itemCount: states_cubit.get(context).mybusiness.length)
                  ],
                ));
          },
          listener: (states, context) {}),
    );
  }
}
