import 'package:flutter/material.dart';
import '../../constants.dart';

import '../../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: isWeb?width/4:width/1.2,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Login Screen", style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              InputField(
                hintText: "Email",
                controller: _emailController,
              ),
              SizedBox(
                height: 25,
              ),
              InputField(
                hintText: "Password",
                controller: _passwordController,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
