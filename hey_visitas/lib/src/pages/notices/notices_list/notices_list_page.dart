import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hey_visitas/src/util/variables_globales.dart';

import '../../../models/notices.dart';
import '../../../util/menu.dart';
import '../../../util/my_colors.dart';
import 'notices_list_contoller.dart';

class NoticesMessagesListPage extends StatefulWidget {
  const NoticesMessagesListPage({Key? key}) : super(key: key);

  @override
  State<NoticesMessagesListPage> createState() => _NoticesMessagesListPageState();
}

class _NoticesMessagesListPageState extends State<NoticesMessagesListPage> {
  late List list_product ;
  String image = "";
  List<Menu> data = [];
  NoticesMessagesListController _con = NoticesMessagesListController();
  List<Notices> filteredUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });

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
              Expanded(
                child: Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: filteredUsers.length,//filteredUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.maxFinite,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 2.0,
                                          style: BorderStyle.solid
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Center (
                                        child: Text('${filteredUsers[index].titulo} ${index.toString()}')
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: ElevatedButton(
                                    onPressed:(){ VariablesGlobales.idNotice = filteredUsers[index].id.toString();
                                      _con.goToNoticesDetail(filteredUsers[index].id.toString(),filteredUsers[index].titulo.toString(),filteredUsers[index].cuerpo.toString());},
                                    style: ElevatedButton.styleFrom(
                                        primary: MyColors.indigo,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        padding: const EdgeInsets.symmetric(vertical: 15)
                                    ),
                                    child: const Text('VER',
                                          )
                                    ,
                                  )
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),


                          ],
                        ),
                      );
                    },
                  ),
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

  Widget _buildList(Menu list) {
    if (list.subMenu.isEmpty)
      return Builder(
          builder: (context) {
            return ListTile(
                onTap:() {Navigator.pushNamed(context!, 'visits');},
                leading: SizedBox(),
                title: Text(list.name.toString())
            );
          }
      );
    return ExpansionTile(
      leading: Icon(list.icon),
      title: Text(
        list.name.toString(),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu.map(_buildList).toList(),
    );
  }

  void refresh() {
    setState(() {
      filteredUsers = _con.noticiesList.isEmpty ? [] : _con.noticiesList;
    }); // CTRL + S
  }
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return const OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(0)),
        borderSide: BorderSide(
          color:Colors.black,
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