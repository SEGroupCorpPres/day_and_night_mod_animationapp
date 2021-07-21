import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:day_and_night_mod_animationapp/size_config.dart';

class Sun extends StatelessWidget {
  const Sun({Key key, @required Duration duration, @required this.isFulSun})
      : _duration = duration,
        super(key: key);
  final Duration _duration;
  final bool isFulSun;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(30),
      bottom: getProportionateScreenWidth(isFulSun ? -45 : -120),
      child: SvgPicture.asset("assets/icons/Sun.svg"),
      duration: _duration,
    );
  }
}
