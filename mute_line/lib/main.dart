import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mute_line/core/cubit/mute_line_app_user_cubit.dart';
import 'package:mute_line/firebase_options.dart';
import 'package:mute_line/mute_line_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => MuteLineAppUserCubit())],
      child: const MuteLineApp(),
    ),
  );
}
