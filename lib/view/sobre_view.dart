import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  final formKey = GlobalKey<FormState>();

  final txtemail = TextEditingController();
  final txtsenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 50),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Sobre o Projeto',
                style: TextStyle(
                  fontSize: 34, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'lib/images/sobre.gif',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Tema: Aplicativo de Lista de Compras\n\nObjetivo: Administrar diversas listas de compras\n\nAluno: Vinícius Correia Santiago\nCód: 836759',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
