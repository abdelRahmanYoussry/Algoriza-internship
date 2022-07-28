import 'package:algorizainternship/SecondTask(ToDoApp)/Shared/AppCubit/app_cubit.dart';
import 'package:algorizainternship/SecondTask(ToDoApp)/Widget/FullTaskWidget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import '../Widget/Divider.dart';
import '../Widget/TasksWidget.dart';

class ScheduleScreen extends StatelessWidget {
   ScheduleScreen({Key? key}) : super(key: key);
   String scheduleTime=DateFormat.yMMMd().format(DateTime.now()) ;
   String weekScheduleTime=DateFormat('EEEE').format(DateTime.now() );
   @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    var cubit=AppCubit.get(context);
    cubit.getDateToScheduleTable(AppCubit.get(context).database, date:scheduleTime );
    bool isChecked = false;
  debugPrint(scheduleTime.toString());
  debugPrint(weekScheduleTime.toString());
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: mediaQuery.height/10,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {Navigator.pop(context);  },
        ),
        titleTextStyle: const TextStyle(
            color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold
        ),
        elevation: 1,
        title: const Text('Schedule'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
           DatePicker(
             DateTime.now(),
             height: mediaQuery.height/10,
             initialSelectedDate: DateTime.now(),
             selectionColor: Colors.green,
             selectedTextColor: Colors.white,
             width: mediaQuery.width/8.5,
             dayTextStyle: const TextStyle(
               fontSize: 12
             ),
            dateTextStyle: const TextStyle(
                fontSize: 14,fontWeight: FontWeight.bold
            ),
             onDateChange: (date){
                debugPrint('${DateFormat('EEEE').format(date)} Date') ;
                weekScheduleTime=DateFormat('EEEE').format(date);
               cubit.getDateToScheduleTable(AppCubit.get(context).database,date:DateFormat.yMMMd().format(date).toString());

             },
           ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: MyDivider(),
            ),
            Row(
              children:  [
                Text(weekScheduleTime,style: const TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold
                ),),
                const Spacer(),
                Text(scheduleTime,style: const TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w500
                ),)

              ],
            ),
           Expanded(
             child: MyTaskFullWidget(
          height: mediaQuery.height/8,
          list: AppCubit.get(context).scheduleTasks,
          buttonHeight: mediaQuery.height/16,
          addTask: false,
          isChecked: isChecked),
           )
          ],
        ),
      ),
    );
  },
);
  }
}
