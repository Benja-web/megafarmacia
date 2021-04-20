import 'package:flutter/material.dart';
import 'package:megafarmacia/preferencias_usuario/preferencias.dart';
import 'package:megafarmacia/routes/routesRoutes.dart';
import 'package:megafarmacia/services.dart/pedidoService.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: routes,
        initialRoute: 'addproducto',
      ),
    );
  }
}
