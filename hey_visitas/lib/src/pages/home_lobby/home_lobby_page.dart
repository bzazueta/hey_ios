import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/pages/home_lobby/home_lobby_controller.dart';

class HomeLobbyPage extends StatefulWidget {
  const HomeLobbyPage({Key? key}) : super(key: key);

  @override
  State<HomeLobbyPage> createState() => _HomeLobbyPageState();
}

class _HomeLobbyPageState extends State<HomeLobbyPage> {

  final HomeLobbyController _con = HomeLobbyController();

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
                        margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.07),
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
                                  _con.goToEscaner
                                  ,
                                  style: ElevatedButton.styleFrom(
                                    side:  BorderSide(width:1, color:Colors.black),
                                    primary: Colors.grey.shade700,
                                    onPrimary: Colors.grey.shade800,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text("Esacnear QR",
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.02),
                        //color: Colors.green,
                        child:
                        Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            Positioned(
                              right: 80,
                              top: 0,
                              child:
                              Container(
                                margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: 50),
                                height: MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.height * 0.3,
                                child:  ElevatedButton(
                                  onPressed: _con.goToRegistrarse,
                                  style: ElevatedButton.styleFrom(
                                    side:  BorderSide(width:1, color:Colors.black),
                                    primary: Colors.grey.shade700,
                                    onPrimary: Colors.grey.shade800,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text("Registrarse",
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
                                      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.01,left: 130),
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
            ],
          ),
        )
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

  void refresh() {
    setState(() {}); // CTRL + S
  }
}