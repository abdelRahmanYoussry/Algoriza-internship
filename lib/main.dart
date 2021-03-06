import 'package:algorizainternship/OnBoarding/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Counter (bloc)/Ui/Counter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}


