
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'dart:io';

class Noticesprovider{

  Future<dynamic> getNotices() async {
    var response ;

    try
    {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };

      response = await dio.Dio().get('${VariablesGlobales.url}/public/api/avisos/listado');
      print(response);
      return response;
    } on DioError  catch (e)  {
      print(e);
      if(e.response?.statusCode == 404)
      {
        return  json.encode({"message": "Error 404.","status":"error"});
      }
      else
      {
        return json.encode({"message": "Error.","status":"error"});
      }
    }

  }

  Future<dynamic> getContentNotices(String idNotice) async {
    var response ;

    try
    {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };

      response = await dio.Dio().get('${VariablesGlobales.url}/public/api/avisos/detalle/${idNotice}');
      print(response);
      return response;
    } on DioError  catch (e)  {
      print(e);
      if(e.response?.statusCode == 404)
      {
        return  json.encode({"message": "Error 404.","status":"error"});
      }
      else
      {
        return json.encode({"message": "Error.","status":"error"});
      }
    }

  }
}