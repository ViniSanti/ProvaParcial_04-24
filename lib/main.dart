// Última edição 31/03/2024
// Vinícius Correia Santiago - 836759

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/cadastro_view.dart';
import 'view/lista_view.dart';
import 'view/login_view.dart';
import 'view/principal_view.dart';
import 'view/sobre_view.dart';



void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),

      initialRoute: 'tlogin',
      routes: {
        'tcadastro' :(context) => CadastroView(),
        'tlista' :(context) => ListaView(),
        'tlogin' :(context) => LoginView(),
        'tprincipal' :(context) => PrincipalView(),
        'tsobre' :(context) => SobreView()
      },
    );
  }
}
