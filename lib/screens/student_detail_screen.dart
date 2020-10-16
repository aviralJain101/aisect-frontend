import 'package:aisect/models/student.dart';
import 'package:aisect/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_student.dart';

class StudentDetailScreen extends StatefulWidget {
  static const routeName = '/student_detail';

  @override
  _StudentDetailScreenState createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as int;
    final student = Provider.of<Student>(context).findById(id);
    return isLoading
        ? SplashScreen()
        : Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.blue[800]])),
              ),
              title: Text(
                student.name,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0),
              ),
              actions: [
                FlatButton(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Provider.of<Student>(context, listen: false)
                        .deleteStudent(student.id);
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     HomeScreen.routeName, (route) => false);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.update),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditStudent(student.id)));
              },
            ),
            body: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Name:  ${student.name}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Father Name:  ${student.fatherName}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Mobile No:  ${student.mobileNo}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Address:  ${student.address}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('University:  ${student.univName}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Course Name:  ${student.courseName}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Fees:  ${student.totalFees}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Course Duration:  ${student.couseDuration}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Admission Date:  ${student.admissionDate}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Remaining Fess:  ${student.remFees}'),
                        SizedBox(
                          height: 40,
                        ),
                        Text('1st Installment:  ${student.firstInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('2nd Installment:  ${student.secondInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('3rd Installment:  ${student.thirdInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('4th Installment:  ${student.fourthInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('5th Installment:  ${student.fifthInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('6th Installment:  ${student.sixthInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('7th Installment:  ${student.seventhInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('8th Installment:  ${student.eighthInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('9th Installment:  ${student.ninthInstall}'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('10th Installment:  ${student.tenthInstall}'),
                      ],
                    ),
                  ),
                )));
  }
}
