import 'package:aisect/models/student.dart';
import 'package:aisect/screens/edit_student.dart';
import 'package:aisect/screens/student_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Student())
      ],
      child: MaterialApp(
        title: 'Aisect',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          //HomeScreen.routeName: (c)=> HomeScreen(),
          StudentDetailScreen.routeName: (c)=> StudentDetailScreen(),
        },
      ),
    );
  }
}