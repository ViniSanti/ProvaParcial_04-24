import 'package:flutter/material.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key}); 

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bem vindo(a)'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),

              Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'lib/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(
                height: 190,
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'tsobre');
                    },

                     style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 113, 207, 65),
                     ),

                    child: Text('Sobre o app',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30),
                  ),
                  ),
                  
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'tlista');
                  },

                     style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 59, 138, 20),
                     ),

                    child: Text('Listas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30),
                  ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}