part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final User? user;
  RegisterLoaded({required this.user});
}

final class RegisterFaller extends RegisterState {
  final String errorMag;
  RegisterFaller(this.errorMag);
}

final class RegisterToggle extends RegisterState {
  final bool isPasswordVisible;
  RegisterToggle(this.isPasswordVisible);
}


