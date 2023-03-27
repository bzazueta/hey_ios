import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/pdf_view/pdf_view_controller.dart';

import '../../util/my_colors.dart';
import '../../util/variables_globales.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewPage extends StatefulWidget {
  const PdfViewPage({Key? key}) : super(key: key);

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {

  PdfViewController _con = PdfViewController();
  int? pages = 0;
  bool isReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context,refresh);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SfPdfViewer.network(
      //     'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
          //controller: _pdfViewerController,
          //key: _pdfViewerStateKey),,
      // appBar: AppBar(
      //    // leading: Icon(Icons.account_circle_rounded),
      //     title: Text('GenerarQR',
      //            style: TextStyle(color: Colors.white))
      //             ,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.green[800]), // set your color here
      //     onPressed: (){},
      //     iconSize: 25,
      //
      //   ),
      //
      //   actions: [
      //     //_shoppingBag()
      //   ],
      //
      //
      //
      // ),
        body: Container
          (
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo.shade400,
                Colors.indigo.shade200,
                Colors.indigo.shade50,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //color: Colors.red,
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.07),
                  // width: double.maxFinite,
                  child: _titulo()
              ),
              Expanded(
                child: Container(
                  // width: double.maxFinite,
                  // height: double.maxFinite,
                  color: Colors.red,
                  margin: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height * 0.04, top:  MediaQuery.of(context).size.height * 0.04,left : MediaQuery.of(context).size.height * 0.02,right :MediaQuery.of(context).size.height * 0.02),
                  // width: double.maxFinite,
                  child: _cardImagen(),
                ),
              ),


            ],
          ),
        )
    );
  }

  Widget _titulo() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          //color: Colors.green,
          //padding: EdgeInsets,
          //width: 50,
          height: 50,

          padding: EdgeInsets.only(left: 10,right: 10),
          child: ElevatedButton(
            onPressed: _con.finish,
            child: const Icon(Icons.arrow_back_ios_new_outlined,size: 16,),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor:
              MaterialStateProperty.all<Color>(MyColors.indigo),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
        Container(
          //width:double.infinity,
          // color: Colors.black,
          width: 300,
          child: const Text('Hey Banco',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
      ],
    );
  }

  Widget _cardImagen(){
    return SfPdfViewer.network(
       'https://sycnos.com/heybanco_qa/public/storage/favisos/qCWsSuV34mhxWrscOs9KV8TeGAJLxSMfwL83FZfw.pdf',
       enableDoubleTapZooming: true,
        canShowScrollHead: true,
        canShowScrollStatus:true);
    // VariablesGlobales.url_image + VariablesGlobales.nombreImagen);
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }
}
