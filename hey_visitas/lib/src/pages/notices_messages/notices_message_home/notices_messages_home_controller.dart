
import 'package:flutter/cupertino.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';

class NoticesMessagesHomeController{
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

  void finish()async{

    Navigator.pop(context!);
  }

  void goToNotices(){
    Navigator.pushNamed(context!, 'noticeslist');

  }

  void goToMessages(){
    Navigator.pushNamed(context!, 'messageslist');

  }
}
