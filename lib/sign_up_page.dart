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
          'Sign up',
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
            SizedBox(
              height: 50,
            ),
            Text("Para continuar, faça cadastro",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 25,
                )),
            FormPage(),
            /*Container(
              color: Colors.grey.shade200,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ainda não é cadastrado?'),
                  Text('Crie sua conta e economize tempo na proxima compra'),
                ],
              ),
            )*/
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
                  if (!value.contains('@')) return "Email não válido";
                  if (!value.contains('.com')) return "Email não válido";
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00bdb1),
                      width: 2.0,
                    ),
                  ),
                  labelText: "E-mail",
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
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) return "Campo vazio";
                  if (value.length < 8) return "Mínimo de 8 caracteres";
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00bdb1),
                      width: 2.0,
                    ),
                  ),
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
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) return "Campo vazio";
                  if (value.length < 10) return "Mínimo de 10 caracteres";
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00bdb1),
                      width: 2.0,
                    ),
                  ),
                  labelText: "Nome",
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
              /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ]),*/
              ElevatedButton(
                child: Text("CADASTRAR"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Signing up..."),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) return Colors.red[900];
                      return Colors.red[800];
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
