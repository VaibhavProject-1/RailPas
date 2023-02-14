import '../.././methods/auth_methods.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

import '../../widgets/input_field.dart';
import 'signup_screen.dart';
import '../home_screen.dart';

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
                children: [
                  Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  const Text("Login Screen", style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 30,),
                  InputField(hintText: "Email",controller: _emailController,),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 25,),
                  InputField(hintText: "Password",controller: _passwordController,),
                  const SizedBox(height: 25,),
                  ElevatedButton(
                    onPressed: (){
                                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                                    showFlushBar(context,"Error","Email or Password Cannot be empty");
                                    }
                                  else{                         
                                    _login(_emailController.text ,_passwordController.text);                          
                                    }

                    }, 
                    child: const Text("Login"),),
                    
            ],
            
          ),Column(
              children: [
                const Text("Don't have an account?")
          ,
                      TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                      }
                      ,
                      child: const Text("SignUp"),
                      ),
              ],
            )
                ],
                
              ),),
              
        ),
      ),
    );
  }



void _login(String email, String password) async{
  setState((){
    showFlushBar(context, "Wait", "Processing");
  });
  String result = await AuthMethods().loginUser(email: email,password: password);
  setState((){
    if (result=="Success")
    {
      showFlushBar(context, result, "Successfully Logged in");
      Future.delayed(const Duration(seconds: 2),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      });
    }
    else
    {
      showFlushBar(context, "Error Occured", result);
    }
  });
  }
}
