import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/service/firebase_service.dart';
import '../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseService authe;
  LoginCubit(this.authe) : super(LoginInitial());

   bool isPassVisa = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login()async{
    if(!formKey.currentState!.validate()){
      emit(LoginFaller("Please enter email and password"));
      return;
    }
    emit(LoginLoading());
    try{
      LoginModel login = LoginModel(
          email: email.text,
          password: password.text,
      );
      User? user = await authe.login(login);
      
      if(user != null){
        emit(LoginLoaded(user));
      }
      else{
        emit(LoginFaller("error in login"));
      }
    }catch (error){
      emit(LoginFaller("$error is error"));
    }

  }

  void toggleIcon(){
    isPassVisa = !isPassVisa;
    emit(LoginToggle(isPassVisa));
  }

  Future<void> close()async{
    email.dispose();
    password.dispose();
    return super.close();
  }
}
