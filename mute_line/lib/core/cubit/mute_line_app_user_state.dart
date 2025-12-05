part of 'mute_line_app_user_cubit.dart';

@immutable
sealed class MuteLineAppUserState {}

final class MuteLineAppUserInitial extends MuteLineAppUserState {}

final class MuteLineAppUserLoaded extends MuteLineAppUserState {
  final UserEntity appUser;

  MuteLineAppUserLoaded({required this.appUser});
}
