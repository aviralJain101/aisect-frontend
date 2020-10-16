import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'http_exception.dart';

class StudentItem {
  int id;
  String name,
      fatherName,
      address,
      mobileNo,
      totalFees,
      firstInstall,
      secondInstall,
      thirdInstall,
      fourthInstall,
      fifthInstall,
      sixthInstall,
      seventhInstall,
      eighthInstall,
      ninthInstall,
      tenthInstall,
      remFees,
      courseName,
      admissionDate,
      couseDuration,
      univName;

  StudentItem(
      {this.address,
      this.admissionDate,
      this.courseName,
      this.couseDuration,
      this.eighthInstall,
      this.fatherName,
      this.fifthInstall,
      this.firstInstall,
      this.fourthInstall,
      this.id,
      this.mobileNo,
      this.name,
      this.ninthInstall,
      this.remFees,
      this.secondInstall,
      this.seventhInstall,
      this.sixthInstall,
      this.tenthInstall,
      this.thirdInstall,
      this.totalFees,
      this.univName});

  Map toMap(StudentItem student) {
    var data = Map<String, dynamic>();
    data['id'] = student.id;
    data['address'] = student.address;
    data['admissionDate'] = student.admissionDate;
    data['courseName'] = student.courseName;
    data['couseDuration'] = student.couseDuration;
    data['eighthInstall'] = student.eighthInstall;
    data['fatherName'] = student.fatherName;
    data['fifthInstall'] = student.fifthInstall;
    data['firstInstall'] = student.firstInstall;
    data['fourthInstall'] = student.fourthInstall;
    data['mobileNo'] = student.mobileNo;
    data['name'] = student.name;
    data['ninthInstall'] = student.ninthInstall;
    data['remFees'] = student.remFees;
    data['secondInstall'] = student.secondInstall;
    data['seventhInstall'] = student.seventhInstall;
    data['sixthInstall'] = student.sixthInstall;
    data['tenthInstall'] = student.tenthInstall;
    data['thirdInstall'] = student.thirdInstall;
    data['totalFees'] = student.totalFees;
    data['univName'] = student.univName;
    return data;
  }

  StudentItem.fromMap(Map<String, dynamic> map) {
    this.address = map['address'];
    this.admissionDate = map['admissionDate'];
    this.courseName = map['courseName'];
    this.couseDuration = map['couseDuration'];
    this.eighthInstall = map['eighthInstall'];
    this.fatherName = map['fatherName'];
    this.fifthInstall = map['fifthInstall'];
    this.firstInstall = map['firstInstall'];
    this.fourthInstall = map['fourthInstall'];
    this.id = map['id'];
    this.mobileNo = map['mobileNo'];
    this.name = map['name'];
    this.ninthInstall = map['ninthInstall'];
    this.remFees = map['remFees'];
    this.secondInstall = map['secondInstall'];
    this.seventhInstall = map['seventhInstall'];
    this.sixthInstall = map['sixthInstall'];
    this.tenthInstall = map['tenthInstall'];
    this.thirdInstall = map['thirdInstall'];
    this.totalFees = map['totalFees'];
    this.univName = map['univName'];
  }
}

class Student with ChangeNotifier {
  List<StudentItem> _student = List<StudentItem>();

  List<StudentItem> get student {
    return [..._student];
  }

  StudentItem findById(int id) {
    for (int i = 0; i < _student.length; i++) {
      if (_student[i].id == id) {
        return _student[i];
      }
    }
    return null;
  }

  Future<void> getAllStudents() async {
    final url = 'https://aisect-backend.herokuapp.com/student/list';
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as List;
      data.forEach((element) {
        _student.add(StudentItem.fromMap(element));
      });
      //print(data);
      // print(data);
      // print(data.length);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addStudent(Map<String, dynamic> map) async {
    final url = 'https://aisect-backend.herokuapp.com/student/details';
    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(map));
      if (response.statusCode > 400) {
        throw HttpException('An error occured while creating a student');
      }
      final data = json.decode(response.body) as Map;
      //print(data);
      _student.add(StudentItem.fromMap(data));
      //print(_student);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateStudent(Map<String, dynamic> map, int id) async {
    var url = 'https://aisect-backend.herokuapp.com/student/details/$id';
    int total = (map['firstInstall']==''
            ? 0
            : int.parse(map['firstInstall'])) +
        (map['secondInstall']=='' ? 0 : int.parse(map['secondInstall'])) +
        (map['thirdInstall']=='' ? 0 : int.parse(map['thirdInstall'])) +
        (map['fourthInstall']=='' ? 0 : int.parse(map['fourthInstall'])) +
        (map['fifthInstall']=='' ? 0 : int.parse(map['fifthInstall'])) +
        (map['sixthInstall']=='' ? 0 : int.parse(map['sixthInstall'])) +
        (map['seventhInstall']==''
            ? 0
            : int.parse(map['seventhInstall'])) +
        (map['eighthInstall']=='' ? 0 : int.parse(map['eighthInstall'])) +
        (map['ninthInstall']=='' ? 0 : int.parse(map['ninthInstall'])) +
        (map['tenthInstall']=='' ? 0 : int.parse(map['tenthInstall']));
    map['remFees'] = (int.parse(map['totalFees']) - total).toString();
    try {
      final response = await http.patch(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(map));
      if (response.statusCode > 400) {
        throw HttpException('An error occured while updating student');
      }
      for (int i = 0; i < _student.length; i++) {
        if (_student[i].id == id) {
          _student[i] = StudentItem.fromMap(map);
          //print(map);
          break;
        }
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteStudent(int id) async {
    final url = 'https://aisect-backend.herokuapp.com/student/details/$id';
    try {
      final response = await http.delete(url);
      //print('hi');
      if (response.statusCode >= 400) {
        throw HttpException('An error occured while deleting student');
      }
      final index = _student.indexWhere((element) => element.id == id);
      _student.removeAt(index);
      //print(_student);
      //print('hey');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
