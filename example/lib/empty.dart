import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Secure Area'),
      ),
      body: Center(
        child: Text("Secure Screen"),
      ),
    );
  }
}
