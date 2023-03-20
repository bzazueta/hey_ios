import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/visits/visits_controller.dart';

import '../../util/my_colors.dart';

class VisitsPage extends StatefulWidget {
  const VisitsPage({Key? key}) : super(key: key);

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> {

  bool frecuente = false;
  VisitsController _con = VisitsController();
  String selectedValueTitular = "Seleccione un departamento";
  String dropdownValueTitular = 'Seleccione un departamento';
  List<DropdownMenuItem<String>> itemsTitular = [
    const DropdownMenuItem(child: Text("Seleccione un departamento"),value: "Seleccione un departamento"),
    DropdownMenuItem(child: Text("Si"),value: "Si"),
    DropdownMenuItem(child: Text("No"),value: "No"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
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
              children: [
                Container(
                  //color: Colors.red,
                    margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.07),
                   // width: double.maxFinite,
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
                                    child: const Text("Visitas",
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
                _txtFecha(),
                _lblDepartamento(),
                _dropDownDepartamento(),
                _lblNombre(),
                _txtNombre(),
                _lblPlacas(),
                _txtPlacas(),
                _frecuente(),
                _identificacion(),
                _buttonCrearVisita(),
                // Container(
                //  // color: Colors.white,
                //   width: double.maxFinite,
                //   child: Row(
                //
                //     children: [
                //       Container(
                //         margin: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.01),
                //         height: MediaQuery.of(context).size.height * 0.05,
                //         width: MediaQuery.of(context).size.height * 0.05,
                //         decoration: const BoxDecoration(
                //           shape: BoxShape.circle,
                //           image: DecorationImage(
                //               image: AssetImage('assets/img/visitas_img.png'),
                //               fit: BoxFit.fill
                //           ),
                //         ),
                //       ),
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.05,
                //         width: MediaQuery.of(context).size.width * 0.8,
                //         child: ElevatedButton(
                //           child: Text("Visitas"),
                //           onPressed: (){},
                //           style: ElevatedButton.styleFrom(
                //             primary: Colors.red,
                //             onPrimary: Colors.white,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(32.0),
                //             ),
                //           ),
                //         ),
                //       ),
                //
                //     ],
                //   ),
                // )
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

  Widget _txtFecha() {
    return Container(
      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.04,left: 20,right: 20),
      width: 250,
      height: 40,
      child: TextField(
        //controller: (){},
        //keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: myinputborder(),
            enabledBorder: myinputborder(), //enabled border
            focusedBorder: myfocusborder(), //focused border
            // labelText: 'Ingrese Su Celular',
            // labelStyle: TextStyle(
            //   color: MyColors.primaryColor,
            //   fontFamily: 'RobotoRegular',
            //   fontSize: 15,
            // ),
            hintText: 'Fecha',
            hintStyle: TextStyle(
              color: MyColors.black,
              fontFamily: 'RobotoRegular',
              fontSize: 15,
            )
        ),
      ),
    );
  }

  Widget _lblDepartamento() {
    return Container(
        margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02),
        child: const Text('Departamento',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontStyle: FontStyle.italic
          ),
        ));
  }

  Widget _dropDownDepartamento()
  {
    return  Container
      (
      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: 20,right: 20),
      width: 250,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      // margin:  EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      // width: double.infinity,
      // height: 58,
      child:
      InputDecorator(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              value: selectedValueTitular,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 26,
              elevation: 5,
              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? data) {
                setState(() {
                  selectedValueTitular = data!;
                  dropdownValueTitular = selectedValueTitular;
                  print(dropdownValueTitular);
                });
              },

              items: itemsTitular

          ),
        ),
      ),


    );
  }

  Widget _lblNombre() {
    return Container(
        margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02),
        child: const Text('Nombre',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontStyle: FontStyle.italic
          ),
        ));
  }

  Widget _txtNombre() {
    return Container(
      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: 20,right: 20),
      width: 250,
      height: 40,
      child: TextField(
        //controller: (){},
        //keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: myinputborder(),
            enabledBorder: myinputborder(), //enabled border
            focusedBorder: myfocusborder(), //focused border
            // labelText: 'Ingrese Su Celular',
            // labelStyle: TextStyle(
            //   color: MyColors.primaryColor,
            //   fontFamily: 'RobotoRegular',
            //   fontSize: 15,
            // ),
            hintText: 'Nombre',
            hintStyle: TextStyle(
              color: MyColors.black,
              fontFamily: 'RobotoRegular',
              fontSize: 15,
            )
        ),
      ),
    );
  }

  Widget _lblPlacas() {
    return Container(
        margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02),
        child: const Text('Placas',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontStyle: FontStyle.italic
          ),
        ));
  }

  Widget _txtPlacas() {
    return Container(
      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: 20,right: 20),
      width: 250,
      height: 40,
      child: TextField(
        //controller: (){},
        //keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: myinputborder(),
            enabledBorder: myinputborder(), //enabled border
            focusedBorder: myfocusborder(), //focused border
            // labelText: 'Ingrese Su Celular',
            // labelStyle: TextStyle(
            //   color: MyColors.primaryColor,
            //   fontFamily: 'RobotoRegular',
            //   fontSize: 15,
            // ),
            hintText: 'Placas',
            hintStyle: TextStyle(
              color: MyColors.black,
              fontFamily: 'RobotoRegular',
              fontSize: 15,
            )
        ),
      ),
    );
  }

  Widget _frecuente() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Checkbox(
        value: true,
        onChanged: null
         ),
        Text('Frecuente',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontStyle: FontStyle.italic
          ),)
      ],
    );
  }

  Widget _identificacion() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [

        const Text('Identificacion',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontStyle: FontStyle.italic
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
          child: ElevatedButton(
            onPressed: (){},
            child: const Text('Seleccionar'),
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

  Widget _buttonCrearVisita() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
      child: ElevatedButton(
        onPressed: (){},
        child: const Text('CREAR VISITA'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.indigo,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return const OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.white,
          width: 1,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color:Colors.white,
          width: 1,
        )
    );
  }

  void refresh() {
    setState(() {}); // CTRL + S
  }
}
