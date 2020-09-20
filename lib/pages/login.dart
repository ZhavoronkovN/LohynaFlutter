import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _LogInFields(),
            _LogInButtons(() => Navigator.pushReplacementNamed(context, '/profile'),
                () => Navigator.pushNamed(context, '/register'))
          ],
        ),
      ),
    );
  }
}

class _LogInFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
      ),
      SizedBox(height: 10),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      )
    ]);
  }
}

class _LogInButtons extends StatelessWidget {
  final Function registerPressed;
  final Function loginPressed;

  _LogInButtons(this.loginPressed, this.registerPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Login'),
          onPressed: () => loginPressed(),
        ),
        Text("Or"),
        RaisedButton(
            child: Text("Register"), onPressed: () => registerPressed())
      ],
    );
  }
}
