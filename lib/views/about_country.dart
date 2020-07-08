// import 'package:api_operation_2/models/api_response.dart';
// import 'package:api_operation_2/models/country_about_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:api_operation_2/services/countryService.dart';

// class AboutCountry extends StatefulWidget {
//   final String id;
//   AboutCountry({this.id});

//   @override
//   _AboutCountryState createState() => _AboutCountryState();
// }

// class _AboutCountryState extends State<AboutCountry> {
//   bool get _isGetId => widget.id!=null; 

//   APIResponse<CouuntryAbout> _apiResponse;
//   bool _isLoading = false;
//   CountryService countryService = GetIt.I<CountryService>();

//   @override
//   void initState() { 
//     super.initState();
//     _fetchDetails();
    
//   }

//   _fetchDetails()async{
//     if(_isGetId){
//       setState(() {
//       _isLoading = true;
//     });
//     _apiResponse = await countryService.getNote(widget.id);
//     setState(() {
//       _isLoading = false;
//     });
//     }
    
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("data"),
//       ),
//       body:  Builder(
//         builder: (_){
//           if(_isLoading){
//             return Center(child: CircularProgressIndicator(),);
//           }
//              return Column(
//           children: [
//             Text(_apiResponse.data.name),
//             Text(_apiResponse.data.code)
//           ],
//         );
//         },
         
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class AboutCountryDetail extends StatelessWidget {
  final String name;
  final String code;

  const AboutCountryDetail({Key key, this.name, this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: ()=>Navigator.of(context).pop(context)),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,style: TextStyle(
              fontSize: 40
            ),),
            Text(code,style: TextStyle(
              fontSize: 30
            ),),
          ],
        ),
      ),
    );
  }
}