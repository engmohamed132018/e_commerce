import 'package:e_commerce/features/Auth/data/auth_model/error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  final AuthModelError error;

  AuthException({required this.error});
}

void handleException(FirebaseAuthException e) {
  throw AuthException(error: AuthModelError(errorMessage: e.message));
}
