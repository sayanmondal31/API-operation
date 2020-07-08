import 'package:flutter/foundation.dart';

class Tax{
  final String name;
  final String code;

  Tax({this.name, this.code});

  factory Tax.fromJson(Map<String,dynamic> item){
    return Tax(
      name: item['name'],
      code: item['code']
    );
  }

}