// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _email;
  late String _password;

  void _submitCommand() {
    //get state of our Form
    final form = _formKey.currentState;

    //`validate()` validates every FormField that is a descendant of this Form,
    // and returns true if there are no errors.
    if (form!.validate()) {
      //`save()` Saves every FormField that is a descendant of this Form.
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      if (_loginCommand()) {
        // Navigate to our Home page
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Show a snackbar with a message
      }
    }
  }

  bool _loginCommand() {
    // Show login details in snackbar
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );
    // _scaffoldKey.currentState!.showSnackBar(snackbar);
    _scaffoldKey.currentState!.showSnackBar(snackbar);

    return true;
  }

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
              validator: (val) => !EmailValidator.validate(val!, true)
                  ? 'Ingresa un mail valido'
                  : null,
              onSaved: (val) => _email = val!,
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
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Por favor agrega una pass';
                }
                return null;
              },
              onSaved: (val) => _password = val!,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
              child: Text('Login'),
              onPressed: () => _submitCommand(),
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
              // onPressed: _submitCommand,
            )),
          ]),
    );
  }
}
