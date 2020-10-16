import 'package:aisect/models/student.dart';
import 'package:aisect/screens/student_detail_screen.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List<StudentItem> school;
  Search(this.school);
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult;
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<StudentItem> suggestionSchool = List<StudentItem>();
    if (query.isNotEmpty) {
      suggestionSchool.addAll(school
          .where((element) => element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList());
    }
    if (query.isEmpty) {
      return Center(
        child: Text('Please search for a Student'),
      );
    } else if (suggestionSchool.isEmpty) {
      return Center(
        child: Text('No Student Found')
      );
    } else {
      return ListView.builder(
        itemCount: suggestionSchool.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(
                StudentDetailScreen.routeName,
                arguments: suggestionSchool[index].id,
              );
            },
            title: Text(suggestionSchool[index].name),
            subtitle: Text(suggestionSchool[index].fatherName),
          );
        },
      );
    }
  }
}
