// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _RegisterScreen(),
      ),
    );
  }
}

class _RegisterScreen extends StatefulWidget {
  _RegisterScreen({Key? key}) : super(key: key);

  @override
  State<_RegisterScreen> createState() => __RegisterScreenState();
}

class __RegisterScreenState extends State<_RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Text(
              'Register',
              // ignore: prefer_const_constructors
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
            // ignore: prefer_const_constructors
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirma Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
              child: Text('Registro'),
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
              child: Text('Login'),
              onPressed: () => Navigator.pushNamed(context, '/login'),
            )),
          ]),
    );
  }
}
