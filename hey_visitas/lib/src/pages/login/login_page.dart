import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/login/login_controller.dart';

import '../../util/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {

  LoginController _con = LoginController();


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
                child: const Text('Usuario',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.04,left: 20,right: 20),
                width: 200,
                height: 40,
                child: _txtUsuario()
              ),
              Container(
                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.04,left: 20,right: 20),
                width: 200,
                height: 40,
                child:_txtPassword()
              ),
              Container(
                  margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.04,left: 20,right: 20),
                  width: 200,
                  child:_buttonLogin()
              ),
              Container(
                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.04),
                width: double.maxFinite,
                child: _txtRecuperaPass()
              ),
            ],
          )
      ),
    );
  }

  Widget _titulo() {
    return const Text('Hey Banco',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontStyle: FontStyle.italic
      ),
    );
  }

  Widget _txtUsuario() {
    return TextField(
      controller: _con.usuarioController,
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

  Widget _txtPassword() {
    return TextField(
      controller: _con.passwordController,
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
          hintText: 'Contraseña',
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
    return GestureDetector(
      onTap: _con.goToForgotPassw,
      child: const Text('No Recuerdo la Contraseña',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            //fontWeight: FontWeight.bold,
            fontSize: 20,
            fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left:20.0,right: 20.0,top: 20),
      child: ElevatedButton(
        onPressed: _con.login,
        child: const Text('LOGIN'),
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
}
