
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../providers/notices_provider.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

class PdfViewController{

  ProgressDialog? _progressDialog;
  BuildContext? context;
  Function? refresh;
  Noticesprovider noticesprovider = Noticesprovider();

  Future init(BuildContext context,Function refresh) async {
    this.context = context;
    _progressDialog = ProgressDialog(context: context);
    _progressDialog?.show(max: 100, msg: 'Cargando información...');

    this.refresh = refresh;

    _progressDialog?.close();
    refresh();
  }

  Future<File> loadPdfFromNetwork(String url) async {
    final response = await  dio.Dio().get(url);
    final bytes = response.data;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = "temp_pdf.pdf";
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }


  void finish()async{

    Navigator.pop(context!);
  }
}