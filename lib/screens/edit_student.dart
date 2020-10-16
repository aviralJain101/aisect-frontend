import 'package:aisect/models/student.dart';
import 'package:aisect/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditStudent extends StatefulWidget {
  int id;
  EditStudent(this.id);
  static const route = '/editStudent';

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  Map<String, dynamic> map = {
    "name": "",
    "fatherName": "",
    "mobileNo": "",
    "address": "",
    "univName": "",
    "courseName": "",
    "totalFees": "",
    "couseDuration": "",
    "admissionDate": "",
    "remFees": "",
    "firstInstall": "",
    "secondInstall": "",
    "thirdInstall": "",
    "fourthInstall": "",
    "fifthInstall": "",
    "sixthInstall": "",
    "seventhInstall": "",
    "eighthInstall": "",
    "ninthInstall": "",
    "tenthInstall": "",
  };

  StudentItem student;

  bool isLoading = false;
  @override
  void initState() {
    if (widget.id != 0) {
      student =
          Provider.of<Student>(context, listen: false).findById(widget.id);
      map = student.toMap(student);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.blue[800]])),
        ),
        title: Text(
          widget.id == 0 ? 'Add Student' : 'Edit Student',
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
      ),
      body: isLoading
          ? SplashScreen()
          : Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                          initialValue: map["name"],
                          onChanged: (val) {
                            map['name'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Father Name',
                          ),
                          initialValue: map["fatherName"],
                          onChanged: (val) {
                            map['fatherName'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Mobile No',
                          ),
                          initialValue: map["mobileNo"],
                          onChanged: (val) {
                            map['mobileNo'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Address',
                          ),
                          initialValue: map["address"],
                          onChanged: (val) {
                            map['address'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'University Name',
                          ),
                          initialValue: map["univName"],
                          onChanged: (val) {
                            map['univName'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Course Name',
                          ),
                          initialValue: map["courseName"],
                          onChanged: (val) {
                            map['courseName'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Total Fees',
                          ),
                          initialValue: map["totalFees"],
                          onChanged: (val) {
                            map['totalFees'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Course Duration',
                          ),
                          initialValue: map["couseDuration"],
                          onChanged: (val) {
                            map['couseDuration'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Admission Date',
                          ),
                          initialValue: map["admissionDate"],
                          onChanged: (val) {
                            map['admissionDate'] = val == '' ? null : val;
                          },
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     labelText: 'Remaining Fees',
                        //   ),
                        //   initialValue: map["remFees"],
                        //   onChanged: (val) {
                        //     map['remFees'] = val == '' ? null : val;
                        //   },
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '1st Install',
                          ),
                          initialValue: map["firstInstall"],
                          onChanged: (val) {
                            map['firstInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '2nd Install',
                          ),
                          initialValue: map["secondInstall"],
                          onChanged: (val) {
                            map['secondInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '3rd Install',
                          ),
                          initialValue: map["thirdInstall"],
                          onChanged: (val) {
                            map['thirdInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '4th Install',
                          ),
                          initialValue: map["fourthInstall"],
                          onChanged: (val) {
                            map['fourthInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '5th Install',
                          ),
                          initialValue: map["fifthInstall"],
                          onChanged: (val) {
                            map['fifthInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '6th Install',
                          ),
                          initialValue: map["sixthInstall"],
                          onChanged: (val) {
                            map['sixthInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '7th Install',
                          ),
                          initialValue: map["seventhInstall"],
                          onChanged: (val) {
                            map['seventhInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '8th Install',
                          ),
                          initialValue: map["eighthInstall"],
                          onChanged: (val) {
                            map['eighthInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '9th Install',
                          ),
                          initialValue: map["ninthInstall"],
                          onChanged: (val) {
                            map['ninthInstall'] = val == '' ? null : val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: '10th Install',
                          ),
                          initialValue: map["tenthInstall"],
                          onChanged: (val) {
                            map['tenthInstall'] = val == '' ? null : val;
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 5,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (widget.id == 0) {
                        setState(() {
                          isLoading = true;
                        });
                        await Provider.of<Student>(context, listen: false)
                            .addStudent(map);
                        setState(() {
                          isLoading = false;
                        });
                        // Navigator.of(context)
                        //     .popAndPushNamed(HomeScreen.routeName);
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        await Provider.of<Student>(context, listen: false)
                            .updateStudent(map, widget.id);
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).pop();
                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //     StudentDetailScreen.routeName,
                        //     ModalRoute.withName(StudentDetailScreen.routeName), arguments: student);
                      }
                    },
                    child: Text("Submit"),
                    color: Colors.green,
                  )
                ],
              ),
            ),
    );
  }
}
