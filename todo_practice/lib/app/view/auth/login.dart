import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_pratice/app/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  //email, password등의 형태를 보여줄 때 사용
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    loginWithEmailAndPassword(
                        _auth,
                        _emailController.text,
                        _passwordController
                            .text); //controller내부의 text가 동적이기 때문에
                  },
                  child: Text('Login'),
                )
              ],
            )));
  }
}
