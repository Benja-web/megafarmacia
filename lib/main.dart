import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:megafarmacia/routes/routesRoutes.dart';
import 'package:megafarmacia/preferencias_usuario/preferencias.dart';

import 'package:megafarmacia/services/loginPasswordRegistroService.dart';
import 'package:megafarmacia/services/loginPasswordService.dart';
import 'package:megafarmacia/services/pedidoService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => new PedidoService()),
        ChangeNotifierProvider(
            create: (BuildContext context) => new LoginPasswordService()),
        ChangeNotifierProvider(
            create: (BuildContext context) => new CamposRegistroService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: routes,
        initialRoute: 'login',
      ),
    );
  }
}
