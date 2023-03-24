import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../providers/visits_provider.dart';
import '../../util/my_dialog.dart';

class VisitsController{

  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  TextEditingController fechaController = new TextEditingController();
  TextEditingController nombreController = new TextEditingController();
  TextEditingController placasController = new TextEditingController();
  String idDepto="";
  VisitsProvider visitsProvider = VisitsProvider();

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    _progressDialog = ProgressDialog(context: context);
     idDepto = VariablesGlobales.departamentos[0].id.toString();
     this.refresh = refresh;
    // user = User.fromJson(await _sharedPref.read('user'));
    // _categoriesProvider.init(context, user);
    // _productsProvider.init(context, user);


    //getCategories();
    refresh();
  }

  void createVisits(String email,String pass,String fecha,
      String nombre,String placas,String dptoId, bool frecuente) async {

    _progressDialog = ProgressDialog(context: context);
    _progressDialog?.show(max: 100, msg: 'Enviando información...');

    bool validado = true;
    //email="usuario@hey.incxx";


      if (fecha.isEmpty) {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa una fecha...');
      }

      if (validado) {
        if (dptoId == 0)
        {
          _progressDialog?.close();
          validado = false;
          MyDialog.showIngreseDatos(
              context!, 'Selecciona un departamento...');
        }
      }

      if (validado) {
        if (nombre.isEmpty)
        {
          _progressDialog?.close();
          validado = false;
          MyDialog.showIngreseDatos(
              context!, 'Ingresa un nombre...');
        }
      }

    if (validado) {
      if (placas.isEmpty) {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa las placas...');
      }
    }

    if (validado) {
      if (VariablesGlobales.image == null) {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Debes seleccionar una identificación...');
      }
    }




    if (validado)
    {
      try
      {
        var data;
        data = await visitsProvider.createVisits(email, pass, fecha, nombre, placas, dptoId, frecuente, VariablesGlobales.image);
        //final data_ = json.decode(data.toString());
        final _data = json.decode(data.toString());
        if (_data['message'] ==  "Datos correctos.") {
          _progressDialog?.close();
          MyDialog.showIngreseDatos(
              context!, _data['message']);
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context!);
            Navigator.pushNamed(context!, 'home');
          });
        }
        else {
          _progressDialog?.close();
          MyDialog.showIngreseDatos(
              context!, _data['message']);
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

  void goToPick(){
    Navigator.pushNamed(context!, 'pickvisits');

  }

}