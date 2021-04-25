import 'package:flutter/material.dart';
import 'package:flutter_bookstore/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPageWidget extends StatefulWidget {
  @override
  _FormPageWidgetState createState() => _FormPageWidgetState();
}

class _FormPageWidgetState extends State<FormPageWidget> {
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
                if (value!.isEmpty) return "Campo vazio";
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
                if (value!.isEmpty) return "Campo vazio";
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
              ],
            ),
            ElevatedButton(
              child: Text("ENTRAR"),
              onPressed: () {
                final userModel = new UserModel(
                    email: 'giorno@giovanna.com',
                    name: 'Giogio',
                    password: '123456789');

                String userModelParsed = userModel.toJson();

                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Logging in..."),
                    duration: Duration(seconds: 3),
                  ));

                  addStringToSF() async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('user', userModelParsed);
                  }

                  addStringToSF();
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.red[900]!;
                    return Colors.red[800]!;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
