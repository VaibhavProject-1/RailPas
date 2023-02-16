import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';



bool isWeb=false;
bool isMobile=true;

FirebaseAuth firebaseAuth= FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;

  void showFlushBar(BuildContext context, String topMessage, String bottomMessage)
  {
    Flushbar(
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 1),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade800,Colors.blueAccent.shade700],
        stops: const [0.6,1]
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        title: topMessage,
        message: bottomMessage,
    ).show(context);
  }