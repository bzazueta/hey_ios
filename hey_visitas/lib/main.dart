import 'package:flutter/material.dart';
import 'package:hey_visitas/src/pages/forgot_password/forgot_page.dart';
import 'package:hey_visitas/src/pages/home/home_page.dart';
import 'package:hey_visitas/src/pages/home_lobby/home_lobby_page.dart';
import 'package:hey_visitas/src/pages/login/login_page.dart';
import 'package:hey_visitas/src/pages/messages/messages_list_page.dart';
import 'package:hey_visitas/src/pages/notices/notices_detail/notices_detail_page.dart';
import 'package:hey_visitas/src/pages/notices/notices_list/notices_list_page.dart';
import 'package:hey_visitas/src/pages/notices_messages/notices_message_home/notices_messages_home_page.dart';
import 'package:hey_visitas/src/pages/provider/provider_page.dart';
import 'package:hey_visitas/src/pages/register/register_page.dart';
import 'package:hey_visitas/src/pages/scaner_qr/scaner_qr_page.dart';
import 'package:hey_visitas/src/pages/visits/visits_page.dart';
import 'package:hey_visitas/src/pages/visits_pending/visits_pending_page.dart';
import 'package:hey_visitas/src/util/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAccesoApp',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'home' : (BuildContext context) => HomePage(),
        'visits' : (BuildContext context) => VisitsPage(),
        'provider' : (BuildContext context) => ProviderPage(),
        'forgotpass' : (BuildContext context) => ForgotPage(),
        'noticesmessages' : (BuildContext context) => NoticesMessagesHomePage(),
        'noticeslist' : (BuildContext context) => NoticesMessagesListPage(),
        'messageslist' : (BuildContext context) => MessagesListPage(),
        'visitspending' : (BuildContext context) => VisitsPendingPage(),
        'homelobby' : (BuildContext context) => HomeLobbyPage(),
        'scanerqr' : (BuildContext context) => ScanerQrPage(),
        'register' : (BuildContext context) => RegisterPage(),
        'noticesdetail' : (BuildContext context) => NoticesDetailPage(),
        // 'detallepagos' : (BuildContext context) => DetallePagoPage(),
        // 'listabitacora' : (BuildContext context) => ListaBitacoraPage(),
        // 'crearusuario' : (BuildContext context) => CrearUsuarioPage(),
        // 'editarusuario' : (BuildContext context) => EditarUsuarioPage(),
        // 'detalleadeudos' : (BuildContext context) => DetalleAdeudosPage(),
        // 'bitacoraaccesoslist' : (BuildContext context) => BitacoraAccesosListPage(),
        // 'detallebitacoraaccesos' : (BuildContext context) => BitacoraAccesosDetallePage(),
        // 'pagotdc' : (BuildContext context) => PagoTdcPage(),
        // 'bitacorapagoslist' : (BuildContext context) => BitacoraPagosListPage(),
        // 'bitacoraadeudoslist' : (BuildContext context) => BitacoraAdeudosListPage(),
        // 'bitacoracomunicadoslist' : (BuildContext context) => BitacoraComunicadosListPage(),
        // 'crearcomunicados' : (BuildContext context) => CrearComunicadosPage(),
        // 'comunicadoslist' : (BuildContext context) => ComunicadosListPage(),
        // 'politicasprivacidad' : (BuildContext context) => PoliticasPrivacidadPage(),
        // 'bitacoradepositoslist' : (BuildContext context) => BitacoraDepositosListPage(),
        // 'bitacoradepositosdetalle' : (BuildContext context) => BitacoraDepositoDetallePage(),
        // 'client/orders/create' : (BuildContext context)
        // 'client/update' : (BuildContext context) => ClientUpdatePage(),
        // 'client/orders/create' : (BuildContext context) => ClientOrdersCreatePage(),
        // 'client/address/list' : (BuildContext context) => ClientAddressListPage(),
        // 'client/address/create' : (BuildContext context) => ClientAddressCreatePage(),
        // 'client/address/map' : (BuildContext context) => ClientAddressMapPage(),
        // 'client/orders/list' : (BuildContext context) => ClientOrdersListPage(),
        // 'client/orders/map' : (BuildContext context) => ClientOrdersMapPage(),
        // 'client/payments/create' : (BuildContext context) => ClientPaymentsCreatePage(),
        // 'client/payments/installments' : (BuildContext context) => ClientPaymentsInstallmentsPage(),
        // 'client/payments/status' : (BuildContext context) => ClientPaymentsStatusPage(),
        // 'restaurant/orders/list' : (BuildContext context) => RestaurantOrdersListPage(),
        // 'restaurant/categories/create' : (BuildContext context) => RestaurantCategoriesCreatePage(),
        // 'restaurant/products/create' : (BuildContext context) => RestaurantProductsCreatePage(),
        // 'delivery/orders/list' : (BuildContext context) => DeliveryOrdersListPage(),
        // 'delivery/orders/map' : (BuildContext context) => DeliveryOrdersMapPage(),
      },
      theme: ThemeData(
        // fontFamily: 'NimbusSans',
          primaryColor: MyColors.primaryColor,
          appBarTheme: AppBarTheme(elevation: 0)
      ),
    );
  }
}
