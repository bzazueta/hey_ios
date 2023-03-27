import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../providers/providers_provider.dart';
import '../../util/my_dialog.dart';
import '../../util/variables_globales.dart';
import 'dart:io';

class ProviderController{

  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  String idDepto="";
  TextEditingController fechaController = new TextEditingController();
  TextEditingController nombreController = new TextEditingController();
  TextEditingController placasController = new TextEditingController();
  TextEditingController empresaController = new TextEditingController();
  TextEditingController ticketController = new TextEditingController();
  TextEditingController telContactoController = new TextEditingController();
  TextEditingController trabajoContactoController = new TextEditingController();
  ProvidersProvider providersProvider = ProvidersProvider();

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    _progressDialog = ProgressDialog(context: context);
    this.refresh = refresh;
    idDepto = VariablesGlobales.departamentos[0].id.toString();
    this.refresh = refresh;
    refresh();
  }

  void createProvider(String celular,String password,String departamento_id,
      String fecha,
      String nombre,
      String empresa,
      File? identificacion,
      String ticket,
      String tel_contacto,
      bool frecuencia,
      String trabajo_realizar,
      String placas) async {

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
      if (departamento_id == "0")
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
      if (empresa.isEmpty) {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa una empresa...');
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

    if (validado) {
      if (placas.isEmpty)
      {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa un responsable...');
      }
    }

    if (validado) {
      if (ticket.isEmpty)
      {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa un ticket...');
      }
    }

    if (validado) {
      if (tel_contacto.isEmpty)
      {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa un télefono de contacto...');
      }
    }

    if (validado) {
      if (trabajo_realizar.isEmpty)
      {
        _progressDialog?.close();
        validado = false;
        MyDialog.showIngreseDatos(
            context!, 'Ingresa el trabajo a realizar...');
      }
    }




    if (validado)
    {
      try
      {
        var data;
        data = await providersProvider.createProvider(VariablesGlobales.usuario, VariablesGlobales.pasw, departamento_id, fecha, nombre, empresa, identificacion, ticket, tel_contacto, frecuencia, trabajo_realizar, placas);
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
    Navigator.pushNamed(context!, 'pickprovider');

  }


}