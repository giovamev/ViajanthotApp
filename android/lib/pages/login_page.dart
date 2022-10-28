import 'dart:convert';
import 'package:android/pages/home_page.dart';
import 'package:android/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../users/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _email = TextEditingController();
  final _password = TextEditingController();

  User userLoad = User.Empty();

  @override
  void initState(){
    _getUser();
    super.initState();
  }

  _getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void validateUser(){
    if(_email.text == userLoad.email && _password.text == userLoad.password){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    else {
      _showMsg("Correo o contraeña incorrecta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/Logo.png'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Correo Electrónico"
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Contraseña"
                  ),
                  keyboardType: TextInputType.text,),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(onPressed:(){
                  validateUser();
                },
                    child: const Text ("Iniciar Sesión")),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.lightGreen)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: const Text("Registrarse"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
