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
            TextFormField(
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
            Column(
              children: [
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
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.white),
                            ),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(40, 40))),
                        onPressed: () => {},
                        child: Text(
                          'ENTRAR',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ]),
              ],
            ),
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
