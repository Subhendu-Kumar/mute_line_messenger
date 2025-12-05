import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mute_line/core/entities/user_entity.dart';

part 'mute_line_app_user_state.dart';

class MuteLineAppUserCubit extends Cubit<MuteLineAppUserState> {
  MuteLineAppUserCubit() : super(MuteLineAppUserInitial());

  void loadAppUser(UserEntity? appUser) {
    if (appUser == null) {
      emit(MuteLineAppUserInitial());
      return;
    }
    emit(MuteLineAppUserLoaded(appUser: appUser));
  }
}
