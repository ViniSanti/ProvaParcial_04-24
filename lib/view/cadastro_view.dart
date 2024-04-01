import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final formKey = GlobalKey<FormState>();

  final txtnome = TextEditingController();
  final txtemail = TextEditingController();
  final txtsenha1 = TextEditingController();
  final txtsenha2 = TextEditingController();

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
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  'Cadastre-se',
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
                  controller: txtnome,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(fontSize: 26),
                    border: OutlineInputBorder(),
                  ),
                  validator: (nome) {
                    if (nome == null || nome.isEmpty) {
                      return 'Informe o Nome';
                    }
                    return null;
                  },
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
                  controller: txtsenha1,
                  obscureText: true,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(fontSize: 26),
                    border: OutlineInputBorder(),
                  ),
                  validator: (senha1) {
                    if (senha1 == null || senha1.isEmpty) {
                      return 'Informe a Senha';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: txtsenha2,
                  obscureText: true,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    labelText: 'Confirme a Senha',
                    labelStyle: TextStyle(fontSize: 26),
                    border: OutlineInputBorder(),
                  ),
                  validator: (senha2) {
                    if (senha2 == null || senha2.isEmpty) {
                      return 'Informe a Senha';
                    } else if (senha2 != txtsenha1.text) {
                      return 'As senhas informadas são diferentes';
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
                          Navigator.pushNamed(context, 'tlogin');
                        } else {}
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 76, 170, 29),
                      ),
                      child: Text('Criar conta',
                          style: TextStyle(
                              color: Colors.white, fontSize: 30)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
