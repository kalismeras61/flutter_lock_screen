# Flutter Pass Code Page or Pin Code Page Package

This package gives you beautiful pass code page for using both android and ios.
<br/><br/>

[![flutter platform](https://img.shields.io/badge/Platform-Flutter-yellow.svg)](https://flutter.io) 
[![pub package](https://img.shields.io/pub/v/flutter_lock_screen.svg)](https://pub.dartlang.org/packages/flutter_lock_screen) 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Demo

<img src="http://www.yasinilhan.com/passcode/howtouse.gif" width="320" height="600" title="Screen Shoot">
<img src="http://www.yasinilhan.com/passcode/1.png" width="300" height="600" title="Screen Shoot">

## Usage
It is really easy to use!
You should ensure that you add the `flutter_lock_screen` as a dependency in your flutter project.

```yaml
dependencies:
  page_transition: '^1.0.0'
```
Than you can use it with below examples.

```dart 
import 'package:flutter/material.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];
    return LockScreen(
        title: "This is Screet",
        passLength: myPass.length,
        bgImage: "images/pass_code_bg.jpg",
        showFingerPass: false,
        fingerFunction: () => print("dede"),
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (List<int> passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }
          return true;
        },
        onSuccess: () {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return null;
          }));
        });
  }
}


```



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.



