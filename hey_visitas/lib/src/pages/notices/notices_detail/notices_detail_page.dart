import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';

import '../../../util/my_colors.dart';
import 'notices_detail_controller.dart';

class NoticesDetailPage extends StatefulWidget {
  const NoticesDetailPage({Key? key}) : super(key: key);

  @override
  State<NoticesDetailPage> createState() => _NoticesDetailPageState();
}

class _NoticesDetailPageState extends State<NoticesDetailPage> {
  String? idNotice = "";
  String? titulo = "";
  String? cuerpo = "";
  NoticesDetailController _con = NoticesDetailController();

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

    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    idNotice = arg['idNotice'].toString();
    titulo = arg['titulo'].toString();
    cuerpo = arg['cuerpo'].toString();

    return Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.red,
                    margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.07),
                    // width: double.maxFinite,
                    child: _titulo()
                ),
                _tituloNoticia(),
                _btnAVerArchivo(),
                _cuerpo(),

              ],
            ),
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

  Widget _tituloNoticia() {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1 ,top:  MediaQuery.of(context).size.height * 0.05, right :MediaQuery.of(context).size.width * 0.1),
      width: double.maxFinite,
      //height: 50,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Text('${titulo}')),

    );
  }

  Widget _btnAVerArchivo() {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1 ,top:  MediaQuery.of(context).size.height * 0.03, right :MediaQuery.of(context).size.width * 0.1),
      child: ElevatedButton(
        onPressed:(){_con.goToSeeFile(VariablesGlobales.nombreImagen);},
        style: ElevatedButton.styleFrom(
            primary: MyColors.indigo,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)
        ),
        child:Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03 ,top:  MediaQuery.of(context).size.height * 0.00, right :MediaQuery.of(context).size.width * 0.03),
          child: Text('VER ARCHIVO',
            style: TextStyle(
              fontSize: 14
            ),
          ),
        )
        ,
      ),
    );
  }

  Widget _cuerpo() {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1 ,top:  MediaQuery.of(context).size.height * 0.05, right :MediaQuery.of(context).size.width * 0.1),
      width: double.maxFinite,
      //height: 200,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Text('${cuerpo}')),
    );
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }
}
