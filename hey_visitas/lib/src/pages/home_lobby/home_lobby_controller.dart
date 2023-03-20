import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class HomeLobbyController{

  ProgressDialog? _progressDialog;
  BuildContext? context;

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

  void goToEscaner(){
    Navigator.pushNamed(context!, 'scanerqr');

  }

  void goToRegistrarse(){
    Navigator.pushNamed(context!, 'register');

  }



}
