import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/see_file/see_file_controller.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';

import '../../util/my_colors.dart';


class SeeFilePage extends StatefulWidget {
  const SeeFilePage({Key? key}) : super(key: key);

  @override
  State<SeeFilePage> createState() => _SeeFilePageState();
}

class _SeeFilePageState extends State<SeeFilePage> {

  SeeFileController _con = SeeFileController();

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
                Container(
                  //color: Colors.red,
                    margin: EdgeInsets.only( top:  MediaQuery.of(context).size.height * 0.04,left : MediaQuery.of(context).size.height * 0.02,right :MediaQuery.of(context).size.height * 0.02),
                    // width: double.maxFinite,
                    child: _cardImagen(),
                ),


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

  Widget _cardImagen(){
    return
      FadeInImage(
        image: VariablesGlobales.nombreImagen != ""
            ? NetworkImage(VariablesGlobales.url_image + VariablesGlobales.nombreImagen)
            : AssetImage('assets/img/no-image.png') as ImageProvider,
        fit: BoxFit.contain,
        fadeInDuration: Duration(milliseconds: 50),
        placeholder: AssetImage('assets/img/no-image.png'),
      );





  }

  void refresh() {
    setState(() {}); // CTRL + S
  }
}
