import 'dart:convert';

import 'package:api_operation_2/models/api_response.dart';
import 'package:api_operation_2/models/college_list.dart';
import 'package:api_operation_2/models/country.dart';
import 'package:api_operation_2/models/country_about_model.dart';
import 'package:api_operation_2/models/tax.dart';
import 'package:http/http.dart' as http;

class CountryService{
  static const API = "https://api.printful.com/countries";
  // static const API2 = "https://api.printful.com/tax/countries";
  static const headers = {
     
    // 'apiKey': 'dd5fce4d-43b6-4cfb-8d9a-93a820a7d10a',
    'content-type':'application/json'
 
  };
//get request from server for many requests in same time
  Future<APIResponse<List<CouuntryDetail>>> getNotesList() {
    return http.get(API , headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData['result']);
        final notes = <CouuntryDetail>[];
        for (var item in jsonData['result']) {
          final note = CouuntryDetail.fromJson(item);
          notes.add(note);
        }
        return APIResponse<List<CouuntryDetail>>(data: notes);
      }
      return APIResponse<List<CouuntryDetail>>(
          error: true, message: 'An error occured');
    }).catchError((_) => APIResponse<List<CouuntryDetail>>(
        error: true, message: 'An error occured'));
  }
}

// class CollegeService{
//   static const CollegeApi = "https://faircareer.000webhostapp.com";
//     static const headers = {
     
//     // 'apiKey': 'dd5fce4d-43b6-4cfb-8d9a-93a820a7d10a',
//     'content-type':'application/json'
 
//   };

//   Future<APIResponse<List<CollegeDetail>>> getCollegeList() {
//     return http.get(CollegeApi+"/get.php",headers: headers).then((data) {
//       if (data.statusCode == 200) {
//         final jsonData = json.decode(data.body);
//         print(jsonData);
//         final colleges = <CollegeDetail>[];
//         for (var item in jsonData) {
//           final note = CollegeDetail.fromJson(item);
//           colleges.add(note);
//         }
//         return APIResponse<List<CollegeDetail>>(data: colleges);
//       }
//       return APIResponse<List<CollegeDetail>>(
//           error: true, message: 'An error occured');
//     }).catchError((_) => APIResponse<List<CollegeDetail>>(
//         error: true, message: 'An error occured'));
//   }

// }

class TaxService{
  static const TaxApi = "https://api.printful.com/tax/countries";
    static const headers = {
     
    // 'apiKey': 'dd5fce4d-43b6-4cfb-8d9a-93a820a7d10a',
    'content-type':'application/json'
 
  };
      Future<APIResponse<List<Tax>>> getTaxList() {
    return http.get(TaxApi,headers: headers ).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData["result"][0]["states"]); //path set correctly
        final tax = <Tax>[];
        for (var item in jsonData["result"][0]["states"]) {
          final note = Tax.fromJson(item);
          tax.add(note);
        }
        return APIResponse<List<Tax>>(data: tax);
      }
      return APIResponse<List<Tax>>(
          error: true, message: 'An error occured');
    }).catchError((_) => APIResponse<List<Tax>>(
        error: true, message: 'An error occured'));
  }
}

