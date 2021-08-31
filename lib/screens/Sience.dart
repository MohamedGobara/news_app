import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widgets/compnents.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/bloc/states_cubit.dart';

class science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<states_cubit, states>(
        builder: (context, states) {
          //   List<Map> mylistbus = states_cubit.get(context).mybusiness;

          return states_cubit() is waitingBusinessSuccessState
              ? CircularProgressIndicator()
              : ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.indigo,
                  height: 0.7,
                );
              },
              itemBuilder: (context, index) {
                return businesswidget(
                    states_cubit.get(context).myscience[index] ,context);
              },
              itemCount: states_cubit.get(context).myscience.length);
        },
        listener: (context, states) {});
  }
}
