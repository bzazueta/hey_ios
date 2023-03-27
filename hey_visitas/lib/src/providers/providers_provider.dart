

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'dart:io';

class ProvidersProvider{



  Future<dynamic> validateProvider(String celular,String password) async {
    var response ;

    try {
      dio.FormData formData = dio.FormData.fromMap({
        'email': celular.trim(),
        'password': password.trim()
      });

      response = await dio.Dio().post('${VariablesGlobales.url}/public/api/proveedor',data: formData);
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


  Future<dynamic> createProvider(String celular,String password,String departamento_id,
  String fecha_registro,
  String nombre,
  String empresa,
  File? image,
  String ticket,
  String tel_contacto,
  bool frecuencia,
  String trabajo_realizar,
  String placas,
  ) async {

    var response ;

    try {
      String? fileName ="";
      fileName = image?.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'email': celular.trim(),
        'password': password.trim(),
        'departamento_id': departamento_id.trim(),
        'fecha_registro': fecha_registro.trim(),
        'nombre': nombre.trim(),
        'empresa': empresa.trim(),
        'responsable': placas.trim(),
        'identificacion':  await MultipartFile.fromFile(image!.path, filename:fileName),
        'ticket': ticket.trim(),
        'tel_contacto': tel_contacto.trim(),
        'frecuencia': frecuencia,
        'trabajo_realizar': trabajo_realizar.trim(),


      });

      response = await dio.Dio().post('${VariablesGlobales.url}/public/api/crear/proveedor',data: formData);
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