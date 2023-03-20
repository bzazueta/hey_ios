



import 'package:flutter/material.dart';

class MyDialog{

   //PagosController pagosController = PagosController();
   late BuildContext context;

  static void show(BuildContext context, String text,) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Mensaje'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                // Icon(Icons.close),
                Text('¿Deseas Cerrar Sesión.?'),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed:
              //con.logout
              (){
                  Navigator.of(context).pop();
                }


            ),
            TextButton(
              child: const Text('Cancelar'),
              onPressed:
                  () {
                Navigator.of(context).pop();
              }
              ,
            ),
          ],
        )
    );
  }

  static void showPagoExitoso(BuildContext context, String mensaje,String id_user,String idJefeCalle,String monto,
      String semanaCobro,String chId,String pagoTipo,String nombreUsuario) {
    //PagoTdcController pagoTdcController = PagoTdcController();
    context = context;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Mensaje'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Icon(Icons.close),
                Text(mensaje),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Aceptar'),
                onPressed:
                    ()
                    {
                       Navigator.of(context).pop();
                       Navigator.pushNamedAndRemoveUntil(context, 'pagotdc', (route) => false);
                       Navigator.pushNamed(context!, 'pagos');
                    }
            ),

          ],
        )
    );
  }

   static void showActualizaVersion(BuildContext context, String _text) {
    String _data = _text;
    //DashBoardController con = new DashBoardController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Mensaje'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                // Icon(Icons.close),
                Text("Tiene una versión antigua. Favor de actualizar su aplicaión para poder usar la app..."),
                //Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Actualizar'),
                onPressed:
                    (){
                      //con.actualizarApp();
                  Navigator.of(context).pop();
                }
            ),
            TextButton(
              child: const Text('Cancelar'),
              onPressed:
                  () {
                Navigator.of(context).pop();
              }
              ,
            ),
          ],
        )
    );
  }


   static void showIngreseDatos(BuildContext context, String msg,) {
     showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: const Text('Mensaje'),
           content: SingleChildScrollView(
             child: ListBody(
               children:  <Widget>[
                 // Icon(Icons.close),
                 Text(msg),
                 //Text('Would you like to approve of this message?'),
               ],
             ),
           ),
           actions: <Widget>[
             // TextButton(
             //     child: const Text('Cerrar'),
             //     onPressed:
             //     //con.logout
             //         (){
             //       Navigator.of(context).pop();
             //     }
             //
             //
             // ),
             TextButton(
               child: const Text('Aceptar'),
               onPressed:
                   () {
                 Navigator.of(context).pop();
               }
               ,
             ),
           ],
         )
     );
   }

   static void showError(BuildContext context, String msg,) {
     showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: const Text('Mensaje'),
           content: SingleChildScrollView(
             child: ListBody(
               children:  <Widget>[
                 // Icon(Icons.close),
                 Text(msg),
                 //Text('Would you like to approve of this message?'),
               ],
             ),
           ),
           actions: <Widget>[
             // TextButton(
             //     child: const Text('Cerrar'),
             //     onPressed:
             //     //con.logout
             //         (){
             //       Navigator.of(context).pop();
             //     }
             //
             //
             // ),
             TextButton(
               child: const Text('Aceptar'),
               onPressed:
                   () {
                 Navigator.of(context).pop();
               }
               ,
             ),
           ],
         )
     );
   }
}