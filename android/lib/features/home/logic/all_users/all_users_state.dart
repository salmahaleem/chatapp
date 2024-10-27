part of 'all_users_cubit.dart';

@immutable
sealed class AllUsersState {}

final class AllUsersInitial extends AllUsersState {}

final class AllUsersLoading extends AllUsersState {}

final class AllUsersLoaded extends AllUsersState {
  final List<UserProfile> users;
  AllUsersLoaded(this.users);
}

final class AllUsersFailure extends AllUsersState {
  final String errorMag;
  AllUsersFailure(this.errorMag);
}
