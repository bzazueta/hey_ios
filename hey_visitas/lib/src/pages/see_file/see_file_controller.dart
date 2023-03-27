
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SeeFileController{

  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  String idDepto="";


  Future init(BuildContext context,Function refresh) async {

    this.context = context;
    _progressDialog = ProgressDialog(context: context);
    this.refresh = refresh;
    refresh();
  }

  void finish()async{

    Navigator.pop(context!);
  }
}