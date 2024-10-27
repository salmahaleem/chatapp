import 'package:rive/rive.dart';

class Constant{
  static const String splash = "Splash";
  static const String register = "Register";
  static const String login = "LoginPage";
  static const String home = "HomePage";
  static const String AllusersPage = "AllUsersPage";




  static StateMachineController? controller ;

  static SMIInput<bool>? isChecking;
  static SMIInput<bool>? isHandsUp;
  static SMIInput<bool>? trigSuccess;
  static SMIInput<bool>? trigFail;
}