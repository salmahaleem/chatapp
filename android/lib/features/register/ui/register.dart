import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../../core/service/firebase_service.dart';
import '../../../core/utils/color_mang.dart';
import '../../../core/utils/constant.dart';
import '../../../core/widget/defualtbutton.dart';
import '../../../generated/assets.dart';
import '../logic/register_cubit.dart';
import 'register_form.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(FirebaseService()),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFaller) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                content: Text(state.errorMag),
                backgroundColor: Colors.red,
            ));
          }
          if (state is RegisterLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                content: Text("Succes"),
                backgroundColor: Colors.green,
            ));
          }
        },
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 500.h,
                width: 330.w,
                decoration: BoxDecoration(
                  color: ColorMang.backgroundLightColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: ColorMang.buttonColor,
                        blurRadius: 20,
                        offset: Offset(0, 8))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          "SignUp",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorMang.buttonColor),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100.h,
                        width: 200.w,
                        child: RiveAnimation.asset(
                          Assets.logincharacter,
                          stateMachines: ["Login Machine"],
                          onInit: (teddy) {
                            Constant.controller =
                                StateMachineController.fromArtboard(
                                    teddy, "Login Machine");
                            if (Constant.controller == null) return;
                            teddy.addController(Constant.controller!);
                            Constant.isChecking =
                                Constant.controller?.findInput("isChecking");
                            Constant.isHandsUp =
                                Constant.controller?.findInput("isHandsUp");
                            Constant.trigSuccess =
                                Constant.controller?.findInput("trigSuccess");
                            Constant.trigFail =
                                Constant.controller?.findInput("trigFail");
                          },
                        ),
                      ),
                      RegisterForm(),
                      SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          if(state is RegisterLoading){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                            return Defualtbutton(
                              buttonText: "SignUp",
                              textStyle: Theme.of(context).textTheme.bodySmall!,
                              onPressed: () {
                                final formKey =
                                    context.read<RegisterCubit>().reformKey;
                                if (formKey.currentState != null &&
                                    formKey.currentState!.validate()) {
                                  context.read<RegisterCubit>().register();
                                  Navigator.pushReplacementNamed(context, Constant.home);
                                }
                              });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: "I have account  ",
                              style: Theme.of(context).textTheme.titleSmall),
                          TextSpan(
                              text: "Login  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorMang.buttonColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, Constant.login);
                              },
                          ),
                        ],

                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
