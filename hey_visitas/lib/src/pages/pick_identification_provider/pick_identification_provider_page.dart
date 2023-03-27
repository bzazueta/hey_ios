import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/pick_identification_provider/pick_identification_provider_controller.dart';

import '../../util/my_colors.dart';

class PickIdentificationProviderPage extends StatefulWidget {
  const PickIdentificationProviderPage({Key? key}) : super(key: key);

  @override
  State<PickIdentificationProviderPage> createState() => _PickIdentificationProviderPageState();
}

class _PickIdentificationProviderPageState extends State<PickIdentificationProviderPage> {

  PickIndentificationProviderController _con = PickIndentificationProviderController();

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
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
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
                //Colors.blue.shade600,
                //Colors.blue.shade400,
                // Colors.lightBlue.shade100,

              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.07),
                  width: double.maxFinite,
                  child: _titulo()
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02),
                        //color: Colors.green,
                        child:
                        Stack(
                          alignment: Alignment.topLeft,
                          children: <Widget>[
                            Positioned(
                              left: 40,
                              top: 0,
                              child:
                              Container(
                                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: 50),
                                height: MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.height * 0.3,
                                child:  ElevatedButton(
                                  onPressed:
                                      (){}
                                  ,
                                  style: ElevatedButton.styleFrom(
                                    side:  BorderSide(width:1, color:Colors.black),
                                    primary: Colors.grey.shade700,
                                    onPrimary: Colors.grey.shade800,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text("Avisos",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18
                                      )),
                                ),

                              ),
                            ),
                            Container(
                              //color: Colors.red,
                                margin: EdgeInsets.only(left: 0),
                                height: MediaQuery.of(context).size.height * 0.09,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Stack(
                                  children: [
                                    // ElevatedButton(
                                    //             child: Text("Visitas",
                                    //                 style: TextStyle(
                                    //                   color: Colors.white
                                    //                 )),
                                    //             onPressed: (){},
                                    //             style: ElevatedButton.styleFrom(
                                    //               primary: Colors.grey.shade800,
                                    //               onPrimary: Colors.grey.shade800,
                                    //               shape: RoundedRectangleBorder(
                                    //                 borderRadius: BorderRadius.circular(32.0),
                                    //               ),
                                    //             ),
                                    //  ),
                                    Container(
                                      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: 60),
                                      //margin: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.01),
                                      height: MediaQuery.of(context).size.height * 0.08,
                                      width: MediaQuery.of(context).size.height * 0.08,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage('assets/img/visitas_img.png'),
                                            fit: BoxFit.fill
                                        ),
                                      ),

                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: _identificacion(),

                  ),

                ],
              ),
              Container(
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.26,
                  //color: Colors.black,
                  child: _cardImagen()),
              Container(
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: 20,right: 20),
                  width: 250,
                  child:_buttonListo()
              ),

            ],
          )
      ),
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

  Widget _identificacion() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [

        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
          child: ElevatedButton(
            onPressed: _con.showAlertGalery,
            child: const Text('GALERIA'),
            style: ElevatedButton.styleFrom(
                primary: MyColors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.symmetric(vertical: 15)
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
          child: ElevatedButton(
            onPressed: _con.showAlertTakePhoto,
            child: const Text('TOMAR FOTO'),
            style: ElevatedButton.styleFrom(
                primary: MyColors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.symmetric(vertical: 15)
            ),
          ),
        ),
      ],
    );
  }

  Widget _cardImagen(){
    return
      FadeInImage(
        image: _con.imageFile != null
            ? FileImage(_con.imageFile!)
            : AssetImage('assets/img/no-image.png') as ImageProvider,
        fit: BoxFit.contain,
        fadeInDuration: Duration(milliseconds: 50),
        placeholder: AssetImage('assets/img/no-image.png'),
      );





  }

  Widget _buttonListo() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
      child: ElevatedButton(
        onPressed: (){
          _con.finish();
        },
        style: ElevatedButton.styleFrom(
            primary: MyColors.indigo,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)
        ),//_con.login,
        child: const Text('LISTO',
          style: TextStyle(
              fontSize: 12
          ),),
      ),
    );
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }

}
