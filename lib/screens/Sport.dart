import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Widgets/compnents.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/bloc/states_cubit.dart';

class spoert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<states_cubit, states>(
        builder: (context, states) {
          var cubit = states_cubit.get(context);

          return states_cubit() is waitingSportSuccessState
              ? CircularProgressIndicator()
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return businesswidget(
                        states_cubit.get(context).mysport[index] , context);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.indigo,
                      height: 0.7,
                    );
                  },
                  itemCount:  states_cubit.get(context).mysport.length,
                );
        },
        listener: (context, states) {});
  }
}
