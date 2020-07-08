import 'package:flutter/foundation.dart';

class CouuntryAbout{
  final String name;
  final String code;

  CouuntryAbout({this.name, this.code});

  factory CouuntryAbout.fromJson(Map<String,dynamic> item){
    return CouuntryAbout(
      name: item['name'],
      code: item['code']
    );
  }

}