part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final User? user;
  LoginLoaded(this.user);
}

final class LoginFaller extends LoginState {
  final String errorMag;
  LoginFaller(this.errorMag);
}

final class LoginToggle extends LoginState {
  final bool isPasswordVisible;
  LoginToggle(this.isPasswordVisible);
}


