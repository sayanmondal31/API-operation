import 'package:api_operation_2/models/api_response.dart';
import 'package:api_operation_2/models/college_list.dart';
import 'package:api_operation_2/models/tax.dart';
import 'package:api_operation_2/services/countryService.dart';
import 'package:api_operation_2/views/about_country.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TaxList extends StatefulWidget {
  @override
  _TaxListState createState() => _TaxListState();
}

class _TaxListState extends State<TaxList> {

  TaxService taxService = GetIt.I<TaxService>();
  APIResponse<List<Tax>> _apiTaxResponse;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCollegeDetails();
  }

  _fetchCollegeDetails() async {
    setState(() {
      _isLoading = true;
    });

    _apiTaxResponse = await taxService.getTaxList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: Builder(

        builder: (BuildContext context) {
          if(_isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
                  return ListView.separated(
          separatorBuilder: (_,__)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              height: 2,
              color: Colors.black,
            ),
          ),
          itemCount: _apiTaxResponse.data.length,
          itemBuilder: (BuildContext context, int index) {
          return Card(
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AboutCountryDetail(
                            name: _apiTaxResponse.data[index].name,
                            code: _apiTaxResponse.data[index].code,
                          )));
                        },
              title: Text( _apiTaxResponse.data[index].name),
              subtitle: Text(_apiTaxResponse.data[index].code),
            ),
          );
         },
        );
        },
      ),
    );
  }
}
