import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hey_visitas/src/models/departments.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../providers/providers_provider.dart';
import '../../providers/users_providers.dart';
import '../../util/my_dialog.dart';

class HomeController{
 ProgressDialog? _progressDialog;
 BuildContext? context;
 UsersProviders usersProvider = new UsersProviders();
 ProvidersProvider providersProvider = ProvidersProvider();

 Deparments? deparments ;
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

 void validateUser() async
 {

   _progressDialog?.show(max: 100, msg: 'Validando usuario...');


     try
     {
       var data = await usersProvider.validateUser(VariablesGlobales.usuario,VariablesGlobales.pasw);
       final _data = json.decode(data.toString());
       if (_data['message'] == 'Datos correctos.' )
       {
         _progressDialog?.close();
         print('respuesta ${_data}');
         VariablesGlobales.departamentos.clear();
         //VariablesGlobales.departamentos.add(deparments!);
         deparments = Deparments(id: 0, descripcion: "Selecciona una opción");
         VariablesGlobales.departamentos.add(deparments!);
         for (var i = 0; i < _data['Departamentos'].length; i++)
         {
            deparments = Deparments(id: _data['Departamentos'][i]['Id'], descripcion: _data['Departamentos'][i]['Descripcion']);
            VariablesGlobales.departamentos.add(deparments!);
         }

         goToVisits();

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

 void validateProvider() async
 {

   _progressDialog?.show(max: 100, msg: 'Validando proveedor...');


   try
   {
     var data = await providersProvider.validateProvider(VariablesGlobales.usuario,VariablesGlobales.pasw);
     final _data = json.decode(data.toString());
     if (_data['message'] == 'Datos correctos.' )
     {
       _progressDialog?.close();
       print('respuesta ${_data}');
       VariablesGlobales.departamentos.clear();
       //VariablesGlobales.departamentos.add(deparments!);
       deparments = Deparments(id: 0, descripcion: "Selecciona una opción");
       VariablesGlobales.departamentos.add(deparments!);
       // for (var i = 0; i < _data['proveedor'].length; i++)
       // {
         deparments = Deparments(id: _data['proveedor']['departamento_id'], descripcion: _data['proveedor']['descripcion']);
         VariablesGlobales.departamentos.add(deparments!);
      // }

       goToProvider();

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

 void goToVisits(){
   Navigator.pushNamed(context!, 'visits');

 }

 void goToProvider(){
   Navigator.pushNamed(context!, 'provider');

 }

 void goToNoticesMessages(){
   Navigator.pushNamed(context!, 'noticesmessages');

 }

 void goToVisitsPending(){
   Navigator.pushNamed(context!, 'visitspending');

 }



}