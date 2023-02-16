import 'package:attsys/screens/image_setup.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/input_field.dart';
import 'login.dart';
import '../../methods/auth_methods.dart';
import '../home_screen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: isWeb?width/4:width/1.2,
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  const Text("Sign Up Screen", style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 30,),
                  InputField(hintText: "User Name",controller: _usernameController,),
                  const SizedBox(height: 30,),
                  InputField(hintText: "Email",controller: _emailController,),                 
                  const SizedBox(height: 25,),
                  InputField(hintText: "Password",controller: _passwordController,),
                  const SizedBox(height: 25,),
                  ElevatedButton(
                    onPressed: (){
                        if(_emailController.text.isEmpty || _passwordController.text.isEmpty || _usernameController.text.isEmpty)
                        {
                          showFlushBar(context,"Error","Email or Username or Password can't be empty");                          
                        }
                        else
                        {                          
                          _signUp(_usernameController.text.trim(),_emailController.text.trim(),_passwordController.text.trim());
                        }


                    }, 
                    child: const Text("Sign Up"),),
                    const SizedBox(height: 25,),

            ],
          ),
            Column(
              children: [
                const Text("Already have an account?")
          ,
                      TextButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen()));
                      }
                      ,
                      child: const Text("Login"),
                      ),
              ],
            )
                ],
                
              ),
              
              ),
        ),
      ),
    );
  }

void _signUp(String username,String email,String password) async{
  setState((){
    showFlushBar(context, "Wait", "Processing");
  });
  String result = await AuthMethods().signUpUser(userName:username,email:email,password:password);
  setState((){
    if (result=="Success")
    {
      showFlushBar(context, result, "Successfully Signed Up");
      Future.delayed(const Duration(seconds: 2),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ImageSetup()));
      });
    }
    else
    {
      showFlushBar(context, "Error Occured", result);
    }
  });
  }


}
