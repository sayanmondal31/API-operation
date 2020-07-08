import 'package:api_operation_2/models/api_response.dart';
import 'package:api_operation_2/models/country.dart';
import 'package:api_operation_2/services/countryService.dart';
import 'package:api_operation_2/views/about_country.dart';
import 'package:api_operation_2/views/collegeList.dart';
import 'package:api_operation_2/views/tax_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  CountryService service = GetIt.I<CountryService>();

  APIResponse<List<CouuntryDetail>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() { 
    super.initState();
    _fetchDetails();
    
  }


  _fetchDetails()async{
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesList();

    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        actions: [
          // IconButton(icon: Icon(Icons.home) , onPressed: ()=>Navigator.push(context, MaterialPageRoute(
          //   fullscreenDialog: true,
          //   builder: (_)=>CollegeList()))),
            IconButton(icon: Icon(Icons.monetization_on), onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TaxList()))
            )
        ],
      ),
      body:Builder(
        builder: (_){
          if(_isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          //TODO:check where is the problem
          // if(_apiResponse.error){
          //   return Center(
          //    child: Text(_apiResponse.message)
          //   );
          // }

          return ListView.separated(
          separatorBuilder: (_,__)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 2,
              color: Colors.black,
            ),
          ),
          itemCount: _apiResponse.data.length,
          itemBuilder: (BuildContext context, int index) {
          return Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AboutCountryDetail(
                            name: _apiResponse.data[index].name,
                            code: _apiResponse.data[index].code,
                          )));
                        },
              title: Text( _apiResponse.data[index].name),
              subtitle: Text(_apiResponse.data[index].code),
            ),
          );
         },
        );
        },
              
      ),
    );
  }
}




