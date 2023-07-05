import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../firebase/firebase_instance.dart';

final authStateProvider = StreamProvider.autoDispose<User?>((ref) {
  return firebaseAuth.authStateChanges();
});

final currentUserProvider = StateNotifierProvider<AuthState, User?>(
  (ref) => AuthState(),
);

class AuthState extends StateNotifier<User?> {
  AuthState() : super(firebaseAuth.currentUser);
}
