import 'package:flutter/material.dart';

import '../screens/auth/login.dart';
import '../screens/auth/signup_screen.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(body: const SignUpScreen());
  }
}
