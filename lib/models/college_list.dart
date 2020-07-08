import 'package:flutter/material.dart';

class CollegeDetail {
  final String id;
  final String title;
  final String description;

  CollegeDetail({
    @required this.id,
    @required this.title,
    @required this.description,
  });

 

  factory CollegeDetail.fromJson(Map<String,dynamic> item){
    return CollegeDetail(
        id:item["id"],
        title: item["title"],
        description: item["description"],
    );
  }

}
