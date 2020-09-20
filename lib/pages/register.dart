import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              _RegisterPhoto(),
              _RegisterFields(),
              RaisedButton(
                child: Text("Register"),
                onPressed: () => {},
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class _RegisterPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          child: Text("Upload photo"),
          onPressed: () => {},
        )
      ],
    );
  }
}

class _RegisterFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
        ]
            .map(
              (e) => Container(
                child: e,
                margin: EdgeInsets.only(bottom: 20),
              ),
            )
            .toList());
  }
}
