import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_andalas/Services/Api.dart';
import 'package:my_andalas/Views/Component/Button.dart';
import 'package:my_andalas/Views/Component/BottomNavigation.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<StatefulWidget> createState() => _loginFormState();
}

class _loginFormState extends State<Loginscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Api api = Api();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _isLoading
          ? const Center(
              child: Text('Menunggu ...'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Image.asset("assets/images/unand.png"),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: const Text("Welcome back! Glad to see you, Again!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      _loginCheck(email, password);
                    },
                    child: const Text("Login",
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
    ));
  }

  _loginCheck(String email, String password) {
    api.login(email, password).then((login) {
      if (login.token != "") {
        setState(() {
          _isLoading = true;
        });
        //Shared Preferences
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const BottomNavigation()));
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => const CupertinoAlertDialog(
                  title: Text("Password or Email is wrong!"),
                  content: Text("Periksa kembali email dan password anda!"),
                ));
      }
    });
  }
}
