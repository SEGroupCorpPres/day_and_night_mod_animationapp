import 'package:flutter/material.dart';
import 'package:day_and_night_mod_animationapp/size_config.dart';
import 'package:day_and_night_mod_animationapp/screens/components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
