import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/provider/provider_controller.dart';
import 'package:intl/intl.dart';

import '../../models/departments.dart';
import '../../util/my_colors.dart';
import '../../util/variables_globales.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {

  bool frecuente = false;
  ProviderController _con = ProviderController();
  String selectedValueTitular = "Seleccione una opción";
  String dropdownValueTitular = "Seleccione una opción";
  List<DropdownMenuItem<String>> itemsTitular = [
    const DropdownMenuItem(child: Text("Seleccione una opción"),value: "Seleccione una opción"),
    DropdownMenuItem(child: Text("Si"),value: "Si"),
    DropdownMenuItem(child: Text("No"),value: "No"),
  ];

  String dropdownValueDptod = '';
  String dropdownValueDpto = '';

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
                          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01),
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
                                    child: const Text("Proveedores",
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
                _fecha(),
                _departamento(),
                _nombre(),
                _empresa(),
                _identificacion(),
                _placas(),
                _ticket(),
                _numeroContacto(),
                _trabajo(),
                _txtTrabajo(),
                _buttonCrearProveedor(),
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
            child: const Icon(Icons.arrow_back_ios_new_outlined,size: 16,),
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

  Widget _fecha() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Fecha',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),
       
        Expanded(
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 35,
            child: TextField(
              controller: _con.fechaController,
              //keyboardType: TextInputType.number,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101)
                );

                if(pickedDate != null ){
                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    _con.fechaController.text = formattedDate; //set output date to TextField value.
                  });
                }else{
                  print("Date is not selected");
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: myinputborder(),
                  enabledBorder: myinputborder(), //enabled border
                  focusedBorder: myfocusborder(), //focused border
                  hintText: 'Fecha',
                  hintStyle: TextStyle(
                    color: MyColors.black,
                    fontFamily: 'RobotoRegular',
                    fontSize: 15,
                  )
              ),
            ),
          ),
        )


      ],
    );
  }

  Widget _departamento() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
         width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Departamento',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),

        Expanded(
          child: Container
         (
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 55,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
            ),
            child:
            InputDecorator(
            decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1))),
            child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
            dropdownColor: Colors.white,
            value:_con.idDepto,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 16,
            elevation: 0,
            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
            underline: Container(
            height: 0,
            color: Colors.deepPurpleAccent,
            ),
            items: VariablesGlobales.departamentos.map<DropdownMenuItem<String>>((Deparments value) {
            return DropdownMenuItem<String>(
            value: value.id.toString(),
            child: Text(value.descripcion.toString(),
            style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            fontStyle: FontStyle.italic
            ),),
            );
            }).toList(),
            onChanged: (String? data) {
            setState(() {
            //var _index =_con.listaCalles.indexOf(data);
            _con.idDepto= data!;
            dropdownValueDptod = _con.idDepto;
            // dropdownValueCalle =  _con.listaCalles![_index].calle.toString();
            // _con.dropDownAsuntoController.text = dropdownValue;
            print(dropdownValueDpto);
            });
            },



            ),
            ),
            ),


            ),
        )


      ],
    );
  }

  Widget _nombre() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Nombre',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),

        Expanded(
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 35,
            child: TextField(
              controller: _con.nombreController,
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
          ),
        )


      ],
    );
  }

  Widget _empresa() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Empresa',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),

        Expanded(
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 35,
            child: TextField(
              controller: _con.empresaController,
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
                  hintText: 'Empresa',
                  hintStyle: TextStyle(
                    color: MyColors.black,
                    fontFamily: 'RobotoRegular',
                    fontSize: 15,
                  )
              ),
            ),
          ),
        )


      ],
    );
  }

  Widget _identificacion() {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [

        Container(
          margin: EdgeInsets.only(left: 10),
          child: const Text('Identificacion',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
          child: ElevatedButton(
            onPressed: _con.goToPick,
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

  Widget _placas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Placas',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),

        Expanded(
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 35,
            child: TextField(
              controller: _con.placasController,
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
          ),
        )


      ],
    );
  }

  Widget _ticket() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Ticket',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),

        Expanded(
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 35,
            child: TextField(
              controller: _con.ticketController,
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
                  hintText: 'Ticket',
                  hintStyle: TextStyle(
                    color: MyColors.black,
                    fontFamily: 'RobotoRegular',
                    fontSize: 15,
                  )
              ),
            ),
          ),
        )


      ],
    );
  }

  Widget _numeroContacto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          //color: Colors.grey,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
          child: const Text('Tel. Contacto',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),),
        ),

        Expanded(
          child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.020,right: MediaQuery.of(context).size.width * 0.015),
            width: 550,
            height: 35,
            child: TextField(
              controller: _con.telContactoController,
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
                  hintText: 'Número de contecto',
                  hintStyle: TextStyle(
                    color: MyColors.black,
                    fontFamily: 'RobotoRegular',
                    fontSize: 15,
                  )
              ),
            ),
          ),
        )


      ],
    );
  }

  Widget _trabajo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.015,right: MediaQuery.of(context).size.width * 0.015),
            child: const Text('Trabajo a realizar',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontStyle: FontStyle.italic
              ),),
          ),
        ),



      ],
    );
  }

  Widget _txtTrabajo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            
            margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: MediaQuery.of(context).size.width * 0.040,right: MediaQuery.of(context).size.width * 0.040),
            width: 550,
            height: 60,
            child: TextField(
              controller: _con.trabajoContactoController,
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
                  hintText: 'Trabajo a realizar',
                  hintStyle: TextStyle(
                    color: MyColors.black,
                    fontFamily: 'RobotoRegular',
                    fontSize: 15,
                  )
              ),
            ),
          ),
        )


      ],
    );
  }

  Widget _buttonCrearProveedor() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
      child: ElevatedButton(
        onPressed: (){_con.createProvider(VariablesGlobales.usuario, VariablesGlobales.pasw, _con.idDepto, _con.fechaController.text, _con.nombreController.text, _con.empresaController.text, VariablesGlobales.image, _con.ticketController.text, _con.telContactoController.text, frecuente, _con.trabajoContactoController.text, _con.placasController.text);},
        child: const Text('CREAR PROVEEDOR'),
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
