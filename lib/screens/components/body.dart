import 'package:day_and_night_mod_animationapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:day_and_night_mod_animationapp/screens/components/land.dart';
import 'package:day_and_night_mod_animationapp/screens/components/rounded_text.dart';
import 'package:day_and_night_mod_animationapp/screens/components/sun.dart';
import 'package:day_and_night_mod_animationapp/screens/components/tabs.dart';
import 'dart:async';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isFullSun = false;
  bool _isDayMod = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isFullSun = true;
      });
    });
  }

  void changeMod(int activeTab) {
    if (activeTab == 0) {
      setState(() {
        _isDayMod = true;
      });
      Future.delayed(Duration(microseconds: 300), () {
        setState(() {
          _isFullSun = true;
        });
      });
    } else {
      setState(() {
        _isFullSun = false;
      });
      Future.delayed(Duration(microseconds: 300), () {
        setState(() {
          _isDayMod = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFF9485),
      if (_isFullSun) Color(0xFFFF9D80),
    ];
    List<Color> darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];
    Duration _duration = Duration(seconds: 1);
    return AnimatedContainer(
      duration: _duration,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDayMod ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          Sun(duration: _duration, isFulSun: _isFullSun),
          Land(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {
                      changeMod(value);
                    },
                  ),
                  VerticalSpacing(),
                  Text(
                    "Good Morning",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  VerticalSpacing(of: 10),
                  Text(
                    "Enter your Informations below",
                    style: TextStyle(color: Colors.white),
                  ),
                  VerticalSpacing(of: 50),
                  RoundedTextField(
                    initialValue: "ouerdemo@gmail.com",
                    hintText: "Password",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
