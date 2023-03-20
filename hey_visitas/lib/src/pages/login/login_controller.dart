

import 'dart:convert';

import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

import '../../providers/users_providers.dart';
import '../../util/my_dialog.dart';
import '../../util/shared_pref.dart';

class LoginController {

  ProgressDialog? _progressDialog;
  BuildContext? context;
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  UsersProviders usersProvider = new UsersProviders();
  bool? isUpdated;
  Function? refresh;
  SharedPref _sharedPref = new SharedPref();

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

  void login() async
  {
    String celular = usuarioController.text.trim();
    String password = passwordController.text.trim();
    print('CELULAR $celular');
    print('PASSWORD $password');
    bool validado = true;
     celular = "usuario@hey.inc";
     password = "123456";

    // celular = "guardia001@hey.inc";
    // password = "123456";


    _progressDialog?.show(max: 100, msg: 'Espere un momento...');

    if (celular.isEmpty && password.isEmpty) {
      _progressDialog?.close();
      MyDialog.showIngreseDatos(
          context!, 'Ingresa  un usuario y contraseña...');
      validado = false;
    }
    if (validado == true) {
      if (celular.isEmpty) {
        _progressDialog?.close();
        MyDialog.showIngreseDatos(context!, 'Ingresa tú usuario ...');
        validado = false;
      }
    }
    if (validado == true) {
      if (password.isEmpty) {
        _progressDialog?.close();
        MyDialog.showIngreseDatos(context!, 'Debes Ingresar la contraseña...');
        validado = false;
      }
    }


    if (validado == true) {
      try {
        var data = await usersProvider.login(celular, password);
        final _data = json.decode(data.toString());
        if (_data['status'] == true )
        {
          _progressDialog?.close();
          print('respuesta ${_data}');
          VariablesGlobales.usuario = _data['user']['email'];
          VariablesGlobales.pasw = password;
          int rol = _data['user']['rol'] ?? 0;
          if(rol == 1)
          {
            Navigator.pushNamedAndRemoveUntil(context!, 'home', (route) => false);
          }
          if(rol == 2)
          {
            Navigator.pushNamedAndRemoveUntil(context!, 'homelobby', (route) => false);
          }

        }
        else {
          _progressDialog?.close();
          MyDialog.showError(context!, _data['text'].toString());
        }
      } catch (e) {
        _progressDialog?.close();
        e.toString();
      }
    }
  }

  void goToForgotPassw(){
    Navigator.pushNamed(context!, 'forgotpass');

  }

}
