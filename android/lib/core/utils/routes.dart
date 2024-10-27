import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/ui/allUsers_page.dart';
import '../../features/home/ui/home_page.dart';
import '../../features/login/ui/login_page.dart';
import '../../features/register/ui/register.dart';
import '../../features/splash/splash.dart';
import 'constant.dart';

class AppRoutes{

  Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case Constant.splash:
        return MaterialPageRoute(builder: (context)=>Splash());

      case Constant.login:
        return MaterialPageRoute(builder: (context)=>LoginPage());

      case Constant.register:
        return MaterialPageRoute(builder: (context)=>Register());

      case Constant.home:
        return MaterialPageRoute(builder: (context)=>HomePage());

      case Constant.AllusersPage:
        return MaterialPageRoute(builder: (context)=>AllUsersPage());

      default:
      return null;
    }
  }
}