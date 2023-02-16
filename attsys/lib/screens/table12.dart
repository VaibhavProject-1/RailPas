import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import '../constants.dart';
import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import '../../widgets/input_field.dart';

class Table12 extends StatefulWidget {
  const Table12({super.key});

  @override
  State<Table12> createState() => _TableState();
}

class _TableState extends State<Table12> {

  String name="";
  String grade="";
  String totalClasses="";
  String presents="";
  String absents="";
  String leaves="";
  String leavesLeft="";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _totalClassesController = TextEditingController();
  final TextEditingController _presentsController = TextEditingController();
  final TextEditingController _absentsController = TextEditingController();
  final TextEditingController _leavesController = TextEditingController();
  final TextEditingController _leavesLeftController = TextEditingController();

  late DatabaseReference dbRef;
   FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    Reference ref = FirebaseStorage.instance.ref().child('profile').child(firebaseAuth.currentUser!.uid);
     CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(title: Text("Data"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 65,),
          InputField(hintText: "Enter Name", controller: _nameController),
          SizedBox(height: 30,),
          InputField(hintText: "Enter Grade", controller: _gradeController),
          SizedBox(height: 30,),
          InputField(hintText: "Enter Total Classes", controller: _totalClassesController),
          SizedBox(height: 30,),
          InputField(hintText: "Enter Present", controller: _presentsController),
          SizedBox(height: 30,),
          InputField(hintText: "Enter Absent", controller: _absentsController),
          SizedBox(height: 30,),
          InputField(hintText: "Enter Leaves", controller: _leavesController),
          SizedBox(height: 30,),
          InputField(hintText: "Enter Leaves Left", controller: _leavesLeftController),
          SizedBox(height: 40,),
          ElevatedButton(
            onPressed: ()async
            {
             await users.add({'name':_nameController.text,"grade":_gradeController.text,"totalClasses":_totalClassesController.text,"presents":_presentsController.text,"absents":_absentsController.text,"leaves":_leavesController.text,"leavesLeft":_leavesLeftController.text});
            },  
            child: const Text("Insert Data"),
            ),
            
        ]),
      
    );
  }


  
  
  }
  
