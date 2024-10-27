import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import '../../../core/widget/chattextfeild.dart';
import '../logic/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().reformKey,
        child: Column(
      children: [
        Chattextfeild(
          onChanged: (value) {
            if (Constant.isHandsUp != null) {
              Constant.isHandsUp!.change(false);
            }
            if (Constant.isChecking == null) return;
            Constant.isChecking!.change(true);
          },
          controller: context.read<RegisterCubit>().email,
          hintText: 'Email',
          isObscureText: false,
          validator: (value) {
            if (value!.isEmpty || value == null || !value.contains("@")) {
              return "please enter valid email";
            }
            return null;
          },
          isFilled: true,
          suffixIcon: Icon(Icons.email),
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            bool isPass = false;
            if(state is RegisterToggle){
              isPass = state.isPasswordVisible;
            }
            return Chattextfeild(
              onChanged: (value) {
                if (Constant.isChecking != null) {
                  Constant.isChecking!.change(false);
                }
                if (Constant.isHandsUp == null) return;
                Constant.isHandsUp!.change(true);
              },
              controller: context.read<RegisterCubit>().password,
              hintText: 'Password',
              isObscureText: !isPass,
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
                       .read<RegisterCubit>()
                       .toggle();
                 },
                 child: Icon(
                   isPass ? Icons.visibility : Icons.visibility_off,
                   size: 24,
                 ),
               ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        Chattextfeild(
          onChanged: (value) {
            if (Constant.isHandsUp != null) {
              Constant.isHandsUp!.change(false);
            }
            if (Constant.isChecking == null) return;
            Constant.isChecking!.change(true);
          },
          controller: context.read<RegisterCubit>().username,
          hintText: 'Username',
          isObscureText: false,
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "please enter valid Username";
            }
            return null;
          },
          isFilled: true,
          suffixIcon: Icon(Icons.person),
        ),
        SizedBox(
          height: 10,
        ),
        Chattextfeild(
          onChanged: (value) {
            if (Constant.isHandsUp != null) {
              Constant.isHandsUp!.change(false);
            }
            if (Constant.isChecking == null) return;
            Constant.isChecking!.change(true);
          },
          controller: context.read<RegisterCubit>().phone,
          hintText: 'Phone',
          isObscureText: false,
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "please enter valid phone";
            }
            return null;
          },
          isFilled: true,
          suffixIcon: Icon(Icons.phone),
        ),
      ],
    ));
  }
}
