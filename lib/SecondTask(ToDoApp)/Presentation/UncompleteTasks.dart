import 'package:algorizainternship/SecondTask(ToDoApp)/Shared/AppCubit/app_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../FirstTask(OnBoardingLogin,Register)/Componets/Componets.dart';
import '../../FirstTask(OnBoardingLogin,Register)/Componets/ElevatedButton.dart';
import '../Widget/Divider.dart';
import '../Widget/FullTaskWidget.dart';
import '../Widget/TasksWidget.dart';
import 'AddTask.dart';

class UnCompleteTasksScreen extends StatelessWidget {
   UnCompleteTasksScreen({Key? key}) : super(key: key);
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return  MyTaskFullWidget(
            height: mediaQuery.height/6,
            list: AppCubit.get(context).unCompleteTasks,
            buttonHeight: mediaQuery.height/16,
            addTask: true,
            showBody: false,
            changeStatus: true,
            isChecked: isChecked);
        },
    );
  }
}
