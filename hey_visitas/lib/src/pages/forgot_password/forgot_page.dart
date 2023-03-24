import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/forgot_password/forgot_controller.dart';

import '../../util/my_colors.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {

  ForgotController _con = ForgotController();

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
              Container(
                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.07),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/img/visitas_img.png'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.04),
                width: double.maxFinite,
                child: const Text('Ingresa tu usuario:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: 20,right: 20),
                  width: 200,
                  height: 40,
                  child: _txtUsuario()
              ),

              Container(
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02,left: 20,right: 20),
                  width: 250,
                  child:_buttonLogin()
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

  Widget _txtUsuario() {
    return TextField(
      controller: _con.emailController,
      keyboardType: TextInputType.number,
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
          hintText: 'Usuario',
          hintStyle: TextStyle(
            color: MyColors.black,
            fontFamily: 'RobotoRegular',
            fontSize: 15,
          )
      ),
    );
  }


  Widget _txtRecuperaPass()
  {
    return const Text('No Recuerdo la Contraseña',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black,
          //fontWeight: FontWeight.bold,
          fontSize: 20,
          fontStyle: FontStyle.italic
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
      child: ElevatedButton(
        onPressed: (){
          _con.forgotPassw(_con.emailController.text);
        },
        style: ElevatedButton.styleFrom(
            primary: MyColors.indigo,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            padding: const EdgeInsets.symmetric(vertical: 15)
        ),//_con.login,
        child: const Text('RECUPERAR \n CONTRASEÑA',
                style: TextStyle(
                    fontSize: 12
                ),),
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
