import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/constant.dart';
import '../../generated/assets.dart';

class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, Constant.register);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:Center(child: Image(image: AssetImage(Assets.assetsChat),)),
    );
  }
}