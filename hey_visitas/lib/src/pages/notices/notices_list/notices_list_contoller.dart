
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../models/notices.dart';
import '../../../providers/notices_provider.dart';

class NoticesMessagesListController{
  ProgressDialog? _progressDialog;
  BuildContext? context;
  Noticesprovider noticesprovider = Noticesprovider();
  Function? refresh;
  Notices? notices;
  List<Notices> noticiesList= [];

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    _progressDialog = ProgressDialog(context: context);
    _progressDialog?.show(max: 100, msg: 'Cargando información...');
    //this.refresh = refresh;
    // user = User.fromJson(await _sharedPref.read('user'));
    // _categoriesProvider.init(context, user);
    // _productsProvider.init(context, user);


    getNotices("");
    //refresh();
  }

  void getNotices(String id_user) async {

    try
    {
      var data = await noticesprovider.getNotices();
      Notices notices = Notices.fromJsonList(data.data);
      noticiesList = notices.toList;
      String categoriaId =noticiesList[0].id.toString();
      print('respuesta ${notices?.toJson()}');
      _progressDialog?.close();

    }catch(e)
    {
      _progressDialog?.close();
      e.toString();
    }
    refresh!();
  }

  void finish()async{

    Navigator.pop(context!);
  }

  void goToNoticesDetail(String id,String titulo,String cuerpo){
    titulo.toString();
    Navigator.pushNamed(context!, 'noticesdetail',arguments: {'idNotice':'${id}',"titulo":'${titulo}',"cuerpo":'${cuerpo}'});

  }
}
