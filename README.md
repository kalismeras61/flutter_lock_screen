# Flutter Pass Code Page or Pin Code Page Package

This package gives you beautiful pass code page for using both android and ios.
<br/><br/>

[![flutter platform](https://img.shields.io/badge/Platform-Flutter-yellow.svg)](https://flutter.io) 
[![pub package](https://img.shields.io/pub/v/flutter_lock_screen.svg)](https://pub.dartlang.org/packages/flutter_lock_screen) 
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Demo

<img src="http://www.yasinilhan.com/passcode/howtouse.gif" width="320" height="600" title="Screen Shoot">
<img src="http://www.yasinilhan.com/passcode/1.png" width="300" height="600" title="Screen Shoot">

## Finger Print Usage
First, be sure you should ensure that you add the `local_auth` package as a dependency.
https://pub.dartlang.org/packages/local_auth

iOS Integration
Note that this plugin works with both TouchID and FaceID. However, to use the latter, you need to also add:
```
<key>NSFaceIDUsageDescription</key>
<string>Why is my app authenticating using face id?</string>
```
to your Info.plist file. Failure to do so results in a dialog that tells the user your app has not been updated to use TouchID.

Android Integration
Update your project's AndroidManifest.xml file to include the USE_FINGERPRINT permissions:
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.example.app">
  <uses-permission android:name="android.permission.USE_FINGERPRINT"/>
<manifest>
```

## Usage
It is really easy to use!
You should ensure that you add the `flutter_lock_screen` as a dependency in your flutter project.

```yaml
dependencies:
  flutter_lock_screen: '^1.0.5'
```
Than you can use it with below example.

```dart 
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:testapp/empty_page.dart';
import 'package:flutter/services.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  bool isFingerprint;

  Future<Null> biometrics() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];
    return LockScreen(
        title: "This is Screet ",
        passLength: myPass.length,
        bgImage: "images/pass_code_bg.jpg",
        fingerPrintImage: "images/fingerprint.png",
        showFingerPass: true,
        fingerFunction: biometrics,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
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
            return EmptyPage();
          }));
        });
  }
}

```



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.



