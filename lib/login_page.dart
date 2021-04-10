import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 30,
              color: Colors.white,
            ),
            width: 50,
          ),
          Container(
            color: Colors.brown[500],
            child: Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            width: 50,
          )
        ],
        centerTitle: true,
        backgroundColor: Color(0xFF00bdb1),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Que livro você procura?",
                labelStyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 60,
            ),
            Text("Para continuar, faça login",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 25,
                )),
            FormPage(),
            Container(
              color: Colors.grey.shade200,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ainda não é cadastrado?'),
                  Text('Crie sua conta e economize tempo na proxima compra'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return "Campo vazio";
                    if (!value.contains('@')) return "Email não valido";
                    if (!value.contains('.com')) return "Email não valido";
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: Color(0xFF00bdb1),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) return "Campo vazio";
                  if (value.length < 8) return "Minimo de 8 caracteres";
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Color(0xFF00bdb1),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ]),
              ElevatedButton(
                child: Text("ENTRAR"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Logging in..."),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
