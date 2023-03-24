import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hey_visitas/src/providers/users_providers.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../util/my_dialog.dart';

class ForgotController{
  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  TextEditingController emailController = new TextEditingController();
  UsersProviders usersProviders = UsersProviders();

  Future init(BuildContext context) async {
    this.context = context;
    _progressDialog = ProgressDialog(context: context);
    //this.refresh = refresh;
    // user = User.fromJson(await _sharedPref.read('user'));
    // _categoriesProvider.init(context, user);
    // _productsProvider.init(context, user);


    //getCategories();
    //refresh();
  }

  void forgotPassw(String email) async {

    _progressDialog = ProgressDialog(context: context);
    _progressDialog?.show(max: 100, msg: 'Enviando información...');

    bool validado = true;
    //email="usuario@hey.incxx";
    if (email.isEmpty)
    {
      _progressDialog?.close();
      validado = false;
      MyDialog.showIngreseDatos(
          context!, 'Ingresa un email...');
    }

    if (validado)
    {
      try
      {
        var data;
        data = await usersProviders.forgotPassw(email);
        final _data = json.decode(data.toString());
        if (_data['status']== true) {
          _progressDialog?.close();
          MyDialog.showIngreseDatos(
              context!, _data['msg']);
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context!);
            Navigator.pushNamed(context!, 'login');
          });
        }
        else {
          _progressDialog?.close();
          MyDialog.showIngreseDatos(
              context!, _data['msg']);
        }
      }catch(e)
      {
        _progressDialog?.close();

      }
    }
  }


  void finish()async{

    Navigator.pop(context!);
  }


}