import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service/firebase_data.dart';
import 'core/utils/constant.dart';
import 'core/utils/routes.dart';
import 'core/utils/styles.dart';
import 'features/home/logic/all_users/all_users_cubit.dart';
import 'features/home/logic/room/room_cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllUsersCubit>(create: (context)=>AllUsersCubit(FireBaseData())),
        BlocProvider<RoomCubit>(create: (context)=>RoomCubit(FireBaseData())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
         builder: (context, child){
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.lightTheme,
          onGenerateRoute: AppRoutes().onGenerateRoute,
          initialRoute: Constant.splash,
         );},
      ),
    );
  }
}

