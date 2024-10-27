import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_mang.dart';
import '../model/room_model.dart';
import '../model/user_profile.dart';

class RoomCard extends StatelessWidget {
  final UserProfile? userProfile;
  final RoomModel roomModel;


  RoomCard({super.key,this.userProfile,required this.roomModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
          title: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15), // Padding inside the card
                decoration: BoxDecoration(
                    color: ColorMang.buttonColor,
                    borderRadius: BorderRadius.circular(20)// Light grey background color
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor:  ColorMang.backgroundLightColor,
                          radius: 30,
                          // Increased size of the profile picture
                          child: Text(
                            userProfile!.name[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.white ,
                              fontSize: 24, // Larger font size for the initial
                            ),
                          ),
                        ),
                        if (userProfile!.online)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green, // Online indicator color
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                  Colors.white, // White border around the dot
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(width: 15), // Spacing between avatar and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userProfile!.name,
                          style: TextStyle(
                            color: Colors.white ,
                            fontSize: 20, // Increased font size for the name
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height:
                            6), // Increased spacing between name and about
                        Text(
                          userProfile!.about,
                          style: TextStyle(
                              color: Colors .white,// Subtle grey color for "about"
                              fontSize: 15,
                              fontWeight: FontWeight.w600// Font size for "about" text
                          ),
                        ),
                        SizedBox(
                            height:
                            6), // Increased spacing between name and about
                        Text(
                          userProfile!.phone,
                          style: TextStyle(
                            color: Colors .white,// Subtle grey color for "about"
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // onTap: () {
          //   context.read<RoomCubit>().createRoom(userProfile.id);
          //   Navigator.pop(context);}
      ),
    );

  }
}