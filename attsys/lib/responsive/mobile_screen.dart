import 'package:attsys/widgets/input_field.dart';
import 'package:flutter/material.dart';

import '../screens/auth/signup_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return const SignUpScreen();
  }
}
