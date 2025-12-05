import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mute_line_auth_state.dart';

class MuteLineAuthCubit extends Cubit<MuteLineAuthState> {
  MuteLineAuthCubit() : super(MuteLineAuthInitial());
}
