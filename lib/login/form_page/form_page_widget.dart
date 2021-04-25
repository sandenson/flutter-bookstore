import 'package:flutter/material.dart';
import 'package:flutter_bookstore/home/home.dart';
import 'package:flutter_bookstore/shared/data/user_dao.dart';
import 'package:flutter_bookstore/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPageWidget extends StatefulWidget {
  @override
  _FormPageWidgetState createState() => _FormPageWidgetState();
}

class _FormPageWidgetState extends State<FormPageWidget> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value!.isEmpty) return "Campo vazio";
                if (!value.contains('@')) return "Email inválido";
                if ('@'.allMatches(value).length > 1) return "Email inválido";
                if (value.indexOf('@') == 0) return "Email inválido";
                if (value.endsWith('@')) return "Email inválido";
                if (value.substring(
                        value.indexOf('@') + 1, value.indexOf('@') + 2) ==
                    '.') return "Email inválido";
                if (!value.endsWith('.com')) return "Email inválido";
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
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) return "Campo vazio";
                if (value.length < 6) return "Mínimo de 6 caracteres";
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  List<UserModel> users = await UsersDao().loadUsers();
                  String userModelParsed = 'null';

                  users.forEach((user) {
                    if (_usernameController.text == user.email &&
                        _passwordController.text == user.password) {
                      userModelParsed = user.toJson();
                    }
                  });

                  if (userModelParsed == 'null') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Burro..."),
                      duration: Duration(seconds: 3),
                    ));
                  } else {
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

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (appContext) => HomePage()),
                    );
                  }
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
