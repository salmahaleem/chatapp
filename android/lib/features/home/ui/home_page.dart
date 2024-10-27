import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../core/service/firebase_service.dart';
import '../../../core/utils/color_mang.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/routes.dart';
import '../logic/all_users/all_users_cubit.dart';
import '../logic/room/room_cubit.dart';
import '../model/room_model.dart';
import '../model/user_profile.dart';
import 'room_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Chat",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorMang.buttonColor),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.logout,
                color: ColorMang.buttonColor,
              ),
              onPressed: () async {
                await FirebaseService().logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Constant.login,
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorMang.buttonColor,
        onPressed: () {
          context.read<AllUsersCubit>().getAllUsersWithoutMe();
          Navigator.pushNamed(context, Constant.AllusersPage);
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DefaultTabController(
            length: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonsTabBar(
                    tabs: [
                      Tab(text: 'Chats'),
                      Tab(text: 'Calls'),
                    ],
                    backgroundColor: ColorMang.buttonColor,
                    unselectedBackgroundColor: ColorMang.backgroundLightColor,
                    borderColor: ColorMang.buttonColor,
                    unselectedBorderColor: ColorMang.buttonColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    buttonMargin: const EdgeInsets.all(10),
                    labelSpacing: 20,
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [
                      BlocBuilder<RoomCubit, RoomState>(
                          builder: (context, state) {
                        if (state is RoomLoading) {
                          return Center(
                              child: const CircularProgressIndicator());
                        }
                        if (state is RoomLoaded) {
                          return ListView.builder(
                              itemCount: state.rooms.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text("Romms"),
                                  subtitle: Text(state.rooms[index].id),
                                );
                               
                              });
                        }
                        if (state is RoomFailure) {
                          return Text(state.errorMesg);

                        }
                        return Text("No Rooms");
                      }),
                      Container(child: Text("hi calls")),
                    ],
                  ))
                ]),
          ),
        ),
      ),
    );
  }
}
