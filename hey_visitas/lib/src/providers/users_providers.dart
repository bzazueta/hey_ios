

import 'package:dio/dio.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

class UsersProviders{

  Future<dynamic> login(String celular,String password) async {
    var response ;

    try {
      dio.FormData formData = dio.FormData.fromMap({
        'email': celular.trim(),
        'password': password.trim()
      });

      response = await dio.Dio().post('${VariablesGlobales.url}/public/api/app/login',data: formData);
      print(response);
      return response;
    } on DioError  catch (e)  {
      print(e);
      return response;
    }

  }

  Future<dynamic> forgotPassw(String email) async {
    var response ;

    try {
      dio.FormData formData = dio.FormData.fromMap({
        'email': email.trim(),
      });

      response = await dio.Dio().post('${VariablesGlobales.url}/public/api/forgot-password',data: formData);
      print(response);
      return response;
    } on DioError  catch (e) {
      print(e);
      return response;
    }

  }

  Future<dynamic> validateUser(String celular,String password) async {
    var response ;

    try {
      dio.FormData formData = dio.FormData.fromMap({
        'email': celular.trim(),
        'password': password.trim()
      });

      response = await dio.Dio().post('${VariablesGlobales.url}/public/api/visitas',data: formData);
      print(response);
      return response;
    } on DioError  catch (e)  {
      print(e);
      return response;
    }

  }
}