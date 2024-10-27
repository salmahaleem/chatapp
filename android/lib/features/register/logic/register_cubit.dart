import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/service/firebase_service.dart';
import '../model/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseService firebaseService;
  RegisterCubit(this.firebaseService) : super(RegisterInitial());

   bool isPass = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController username = TextEditingController();

  final GlobalKey <FormState> reformKey = GlobalKey <FormState> ();

  Future<void> register()async{
    if(!reformKey.currentState!.validate()){
      emit(RegisterFaller("Please enter your info"));
      return;
    }
      emit(RegisterLoading());
    try{
      RegisterModel registerModel = RegisterModel(
          email: email.text,
          name: username.text,
          phone: phone.text,
          password: password.text,
      );
      User? user = await firebaseService.register(registerModel);
      if(user != null){
        emit(RegisterLoaded(user: user));
      }else{
        emit(RegisterFaller("there is error"));
      }

    }catch(error){
      emit(RegisterFaller("$error is error"));
    }

  }

  void toggle(){
    isPass = !isPass;
    emit(RegisterToggle(isPass));
  }


  Future<void> close(){

    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();

    return super.close();

  }


}
