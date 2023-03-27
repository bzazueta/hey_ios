
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../providers/notices_provider.dart';
import '../../../util/my_dialog.dart';

class NoticesDetailController{

  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  Noticesprovider noticesprovider = Noticesprovider();

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    _progressDialog = ProgressDialog(context: context);
    _progressDialog?.show(max: 100, msg: 'Cargando información...');
    this.refresh = refresh;
    // user = User.fromJson(await _sharedPref.read('user'));
    // _categoriesProvider.init(context, user);
    // _productsProvider.init(context, user);


    getContentNotices();
    //refresh();
  }

  void getContentNotices() async {

    try
    {
      var data = await noticesprovider.getContentNotices(VariablesGlobales.idNotice);
      final _data = json.decode(data.toString());
      VariablesGlobales.nombreImagen = _data['archivo'] ?? '';
      print('respuesta ${VariablesGlobales.nombreImagen}');
      _progressDialog?.close();
    }catch(e)
    {
      _progressDialog?.close();
      e.toString();
    }
    refresh!();
  }

  void goToSeeFile(String archivo){
    if(archivo.contains(".pdf"))
    {
        Navigator.pushNamed(context!, 'seepdf');
    }
    if(archivo.contains(".png") || archivo.contains(".jpg") || archivo.contains(".jpeg"))
    {
      Navigator.pushNamed(context!, 'seefile');
    }
    else if (archivo.isEmpty)
    {
      MyDialog.showIngreseDatos(
          context!, 'Esta noticia no contiene archivo...');
    }


  }

  void goToSeePdf(){
    Navigator.pushNamed(context!, 'seepdf');

  }


  void finish()async{

    Navigator.pop(context!);
  }
}