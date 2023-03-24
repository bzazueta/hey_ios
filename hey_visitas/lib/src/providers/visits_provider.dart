

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'dart:io';

class VisitsProvider{

  Future<dynamic> createVisits(String email,String pass,String fecha,
      String nombre,String placas,String dptoId, bool frecuente,File? imagen) async {
    var response ;

    try {
      String? fileName ="";
      fileName = imagen?.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'email': email.trim(),
        'password': pass.trim(),
        'departamento_id': dptoId,
        'fecha_registro': fecha,
        'nombre': nombre.trim(),
        'placas': placas.trim(),
        'identificacion': await MultipartFile.fromFile(imagen!.path, filename:fileName),
        'frecuencia': frecuente
      });

      response = await dio.Dio().post('${VariablesGlobales.url}/public/api/crear/visitas',data: formData);
      print(response);
      return response;
    } on DioError  catch (e)
    {
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