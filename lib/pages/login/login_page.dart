// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  _LoginScreen({Key? key}) : super(key: key);

  @override
  State<_LoginScreen> createState() => __LoginScreenState();
}

class __LoginScreenState extends State<_LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Image(
                image: NetworkImage(
                    'https://uft.cl/images/la_universidad/imagen-corporativa/Institucional/Logo_FINIS_institucional.png')),
            const SizedBox(height: 20),
            SizedBox(
              height: 44,
            ),
            TextFormField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
              child: Text('Login'),
              onPressed: () => Navigator.pushNamed(context, '/'),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('O'),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
              child: Text('Registro'),
              onPressed: () => Navigator.pushNamed(context, '/register'),
            )),
          ]),
    );
  }
}
