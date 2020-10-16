import 'package:aisect/models/student.dart';
import 'package:aisect/screens/student_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  List<StudentItem> students;
  @override
  Widget build(BuildContext context) {
    students = Provider.of<Student>(context, listen: false).student;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          //reverse: true,
          itemCount: students.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                  title: Text(students[i].name),
                  subtitle: Text(students[i].fatherName),
                  trailing: Text(students[i].remFees),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      StudentDetailScreen.routeName,
                      arguments: students[i].id,
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
