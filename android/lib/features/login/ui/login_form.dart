import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constant.dart';
import '../../../core/widget/chattextfeild.dart';
import '../logic/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            Chattextfeild(
              onChanged: (value){
                if(Constant.isHandsUp != null){
                  Constant.isHandsUp!.change(false);
                }
                if(Constant.isChecking == null) return;
                Constant.isChecking!.change(true);
              },
              controller: context.read<LoginCubit>().email,
              hintText: 'Email',
              isObscureText: false,
              validator: (value) {
                if (value!.isEmpty || value == null || !value.contains("@")) {
                  return "please enter valid email";
                }
                return null;
              },
              isFilled: true,

            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                bool isPassVis = false;
                if (state is LoginToggle) {
                  isPassVis = state.isPasswordVisible;
                }
                return Chattextfeild(
                  onChanged: (value){
                    if(Constant.isChecking != null){
                      Constant.isChecking!.change(false);
                    }
                    if(Constant.isHandsUp == null) return;
                    Constant.isHandsUp!.change(true);
                  },
                  controller: context.read<LoginCubit>().password,
                  hintText: 'Password',
                  isObscureText: !isPassVis,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return "please enter valid password";
                    }
                    return null;
                  },
                  isFilled: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context
                          .read<LoginCubit>()
                          .toggleIcon();
                    },
                    child: Icon(
                      isPassVis ? Icons.visibility : Icons.visibility_off,
                      size: 24,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget password ?",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        decoration: TextDecoration.underline
                      ),
                    ))),
          ],
        ));
  }
}
