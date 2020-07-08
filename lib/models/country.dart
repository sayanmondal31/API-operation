import 'package:flutter/foundation.dart';

class CouuntryDetail{
  final String name;
  final String code;

  CouuntryDetail({this.name, this.code});

  factory CouuntryDetail.fromJson(Map<String,dynamic> item){
    return CouuntryDetail(
      name: item['name'],
      code: item['code']
    );
  }

}