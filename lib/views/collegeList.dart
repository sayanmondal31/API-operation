// import 'package:api_operation_2/models/api_response.dart';
// import 'package:api_operation_2/models/college_list.dart';
// import 'package:api_operation_2/services/countryService.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// class CollegeList extends StatefulWidget {
//   @override
//   _CollegeListState createState() => _CollegeListState();
// }

// class _CollegeListState extends State<CollegeList> {
//   CollegeService collegeService = GetIt.I<CollegeService>();

//   APIResponse<List<CollegeDetail>> _apiResponse;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchCollegeDetails();
//   }

//   _fetchCollegeDetails() async {
//     setState(() {
//       _isLoading = true;
//     });

//     _apiResponse = await collegeService.getCollegeList();

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("hello")),
//       body: Builder(

//         builder: (BuildContext context) {
//           if(_isLoading){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//                   return ListView.separated(
//           separatorBuilder: (_,__)=>Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Divider(
//               height: 2,
//               color: Colors.black,
//             ),
//           ),
//           itemCount: _apiResponse.data.length,
//           itemBuilder: (BuildContext context, int index) {
//           return Card(
//                       child: ListTile(
//                         // onTap: (){
//                         //   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AboutCountryDetail(
//                         //     name: _apiResponse.data[index].name,
//                         //     code: _apiResponse.data[index].code,
//                         //   )));
//                         // },
//               title: Text( _apiResponse.data[index].title),
//               subtitle: Text(_apiResponse.data[index].description),
//             ),
//           );
//          },
//         );
//         },
//       ),
//     );
//   }
// }
