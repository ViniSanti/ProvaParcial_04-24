import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final txtemail = TextEditingController();
  final txtsenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 50),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'lib/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: txtemail,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 26),
                  border: OutlineInputBorder(),
                ),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Informe o Email';
                  } else if (!EmailValidator.validate(email, true)) {
                    return "Informe um Email válido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: txtsenha,
                obscureText: true,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(fontSize: 26),
                  border: OutlineInputBorder(),
                ),
                validator: (senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Informe a Senha';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, 'tprincipal');
                      } else {
                        // Erro na Validação
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 113, 207, 65),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'tcadastro');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 59, 138, 20),
                    ),
                    child: Text(
                      'Registre-se',
                      style: TextStyle(color: Colors.white, fontSize: 30),
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
