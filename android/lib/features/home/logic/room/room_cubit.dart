import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/service/firebase_data.dart';

import '../../model/room_model.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  FireBaseData fireBaseData;
  RoomCubit(this.fireBaseData) : super(RoomInitial());


  Future<void> createRoom(String userId)async{
    emit(RoomLoading());
    try{
     final roomId = await fireBaseData.createRoom(userId);
     emit(RoomCreated(roomId));
    }
    catch(error){
      emit(RoomFailure("error is $error"));
    }
  }
  StreamSubscription<List<RoomModel>>? streamSubscription;

  void getRooms(){
    streamSubscription = fireBaseData.getAllRooms().listen((rooms){
      emit(RoomLoaded(rooms));

    },onError: (error){
      emit(RoomFailure(error.toString()));
    }
    );

  }

  // @override
  // Future<void> close() {
  //   streamSubscription?.cancel();
  //   return super.close();
  // }


}
