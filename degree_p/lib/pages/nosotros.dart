import 'package:flutter/material.dart';

class Nosotros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Entrenadores"),
      ),
      body: new Center(
        child: new Text('Somos tu entrenador personal...'),
      ),
    );
  }
}