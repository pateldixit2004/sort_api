// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sort_api/screen/view/charts_screen.dart';
// import 'package:sort_api/screen/view/home_screen.dart';
// import 'package:sort_api/screen/view/other.dart';
// import 'package:sort_api/screen/view/tabScreen.dart';
//
// void main() {
//   runApp(GetMaterialApp(debugShowCheckedModeBanner: false, routes: {
//     "/": (p0) => TabScreen(),
//   }));
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  bool _isEmailValid = true;

  void _validateEmail() {
    setState(() {
      _isEmailValid = _emailRegExp.hasMatch(_emailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Validation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                errorText: _isEmailValid ? null : 'Invalid email format',
              ),
              onChanged: (value) => _validateEmail(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Do something with the valid email address
                if (_isEmailValid) {
                  print('Valid email: ${_emailController.text}');
                } else {
                  print('Invalid email');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
