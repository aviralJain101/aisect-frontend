import 'package:aisect/models/student.dart';
import 'package:aisect/screens/splash_screen.dart';
import 'package:aisect/widgets/home_list.dart';
import 'package:aisect/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_student.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Student>(context, listen: false).getAllStudents().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Student>(context).student;
    return isLoading ? SplashScreen() : Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue[600], Colors.green])),
        ),
        title: const Text(
          'Aisect',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search(students));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditStudent(0)));
          },
          backgroundColor: Colors.green,
          hoverColor: Colors.blue,
          tooltip: 'Add A Student'),
      //drawer: AppDrawer(),
      body: HomeList(),
    );
  }
}
