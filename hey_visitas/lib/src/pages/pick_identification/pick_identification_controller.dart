
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class PickIdentificationController{

  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  PickedFile? pickedFile;
  File? imageFile;

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    _progressDialog = ProgressDialog(context: context);
    this.refresh = refresh;
    // user = User.fromJson(await _sharedPref.read('user'));
    // _categoriesProvider.init(context, user);
    // _productsProvider.init(context, user);


    //getCategories();
    //refresh();
  }

  void showAlertDialog() {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.gallery);
        },
        child: Text('GALERIA')
    );

    Widget cameraButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.camera);
        },
        child: Text('CAMARA')
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona tu imagen'),
      actions: [
        galleryButton,
        cameraButton
      ],
    );

    showDialog(
        context: context!,
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }

  void showAlertGalery() {

    selectImage(ImageSource.gallery);
  }

  void showAlertTakePhoto() {
    selectImage(ImageSource.camera);
  }

  Future selectImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      VariablesGlobales.image = imageFile;

    }
    //Navigator.pop(context!);
    refresh!();
  }

  void finish()async{

    Navigator.pop(context!);
  }
}