// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [Colors.indigo.shade400, Colors.indigo.shade900])),
            child: null,
          ), // Background
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: Platform.isAndroid
                    ? EdgeInsets.only(top: 80, left: 32, right: 32)
                    : EdgeInsets.only(top: 150, left: 32, right: 32),
                child: Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 62)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 32, bottom: 48),
                child: Text("Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 26)),
              ),
              Expanded(
                child: Material(
                  child: ListView(
                    children: [formView()],
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget formView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            shadowColor: Colors.indigo.shade100,
            elevation: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                singleInputView(hint: 'Email or Phone Number'),
                Divider(),
                singleInputView(hint: 'Password'),
              ],
            ),
          ),
          formButtonsView()
        ],
      ),
    );
  }

  Widget formButtonsView() {
    return Column(
      children: [forgotView(), loginButtonView(), socialMediaView()],
    );
  }

  Widget socialMediaView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 32),
          child: Text(
            "Continue with social media",
            style: TextStyle(fontSize: 18, color: Colors.black45),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            socialButton(color: Colors.blue.shade600, text: 'Facebook'),
            socialButton(color: Colors.black87, text: 'Github'),
          ],
        )
      ],
    );
  }

  Widget socialButton({required Color color, required String text}) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget forgotView() {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 32),
      child: Text(
        "Forgot Password?",
        style: TextStyle(fontSize: 18, color: Colors.black45),
      ),
    );
  }

  Widget loginButtonView() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Login",
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fixedSize: Size(210, 60),
      ),
    );
  }

  Widget singleInputView({required String hint}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextField(
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
      ),
    );
  }
}
