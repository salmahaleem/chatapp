part of 'room_cubit.dart';

@immutable
sealed class RoomState {}

final class RoomInitial extends RoomState {}

final class RoomLoading extends RoomState {}

final class RoomLoaded extends RoomState {
  final List<RoomModel>rooms;
  RoomLoaded(this.rooms);
}

final class RoomCreated extends RoomState {
 final String roomId;
 RoomCreated(this.roomId);
}

final class RoomFailure extends RoomState {
  final String errorMesg;
  RoomFailure(this.errorMesg);
}

