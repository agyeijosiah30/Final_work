
import 'dart:ui';
import 'package:final_work/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_work/reusable_widget/reusable_widget.dart';
import 'package:final_work/screens/signup.dart';
import 'package:final_work/utils/color_utils.dart';





class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 0),
            child: Column(
              children:<Widget> [
                logoWidget("images/logo1.png",),
                SizedBox(height: 30,),
                reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
                SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(height: 20,),
                signInSignupButton(context, true, (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text, password: _passwordTextController.text).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));

                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });

                }),
                signUpOption()



              ],),),),


      ),);
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text("Don't have an account?",
          style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
          },
          child: const Text(" Sign Up", style: TextStyle(color: Colors.white, fontWeight:  FontWeight.bold),
          ),
        )


      ],
    );
  }

}
