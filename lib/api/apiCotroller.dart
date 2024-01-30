import 'package:dio/dio.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ApiController{


  Future<List<dynamic>> getdatas()async{

    final response = await Dio().get('https://saiyaapi.site/cnth/prak');

    final datas = response.data['payload'];
    return datas;
  }

//Contoh FETCH API dengan parameter menggunakan GET
  // Future<List<dynamic>> getdata()async{

  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final pins = await prefs.getString('pin');

  //   final _datas = {
  //     'pin' = pins
  //   };

  //   final response = await Dio().get('https://saiyaapi.site' + '/cnth/prak', data: _datas);

  //   final datas = response.data['payload'];
  //   return datas;
  // }
}