import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/all_users/all_users_cubit.dart';
import 'CardSelectedUsers.dart';

class AllUsersPage extends StatelessWidget{
  const AllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AllUsersCubit,AllUsersState>(builder: (context,state){
          if(state is AllUsersLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is AllUsersLoaded){
            return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context,index){
                 return CardSelectedUsers(userProfile: state.users[index],);
                });
          }
          if(state is AllUsersFailure){
            return Center(child: Text("error ${state.errorMag}"));
          }
          return Center(child: Text("no users"));
        }),
      ),
    );
  }

}

