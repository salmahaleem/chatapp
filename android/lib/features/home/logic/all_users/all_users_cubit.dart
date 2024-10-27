import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/service/firebase_data.dart';
import '../../model/user_profile.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  final FireBaseData fireBaseData;
  AllUsersCubit(this.fireBaseData) : super(AllUsersInitial());

  StreamSubscription<List<UserProfile>>? streamSubscription;

  void getAllUsersWithoutMe(){
    emit(AllUsersLoading());
    streamSubscription = fireBaseData.getAllUsersWithoutMe().listen((users) {
      emit(AllUsersLoaded(users));

    },onError: (error){
      emit(AllUsersFailure(error.toString()));
    }
    );

  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }


}
