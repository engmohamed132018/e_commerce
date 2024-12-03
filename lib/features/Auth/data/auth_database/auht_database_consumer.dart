abstract class AuthDBConsumer {
  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail({
    required String email,
    dynamic actionCodeSettings,
  });

  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
