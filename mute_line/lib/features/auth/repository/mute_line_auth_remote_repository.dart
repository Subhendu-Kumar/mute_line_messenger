import 'package:firebase_auth/firebase_auth.dart';
import 'package:mute_line/core/services/base_firebase_repository.dart';

class MuteLineAuthRemoteRepository extends BaseFirebaseRepository {
  Stream<User?> get authStateChanges => auth.authStateChanges();
}
