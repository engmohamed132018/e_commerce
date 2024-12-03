class AuthState {}

final class AuthInitial extends AuthState {}

final class Authloadingstate extends AuthState {}

final class AuthSignInloadingsState extends AuthState {}

final class AuthSignInScussesState extends AuthState {
  final String token;
  final String uid;

  AuthSignInScussesState({required this.token, required this.uid});
}

final class AuthSignInFailureState extends AuthState {
  final dynamic error;

  AuthSignInFailureState({required this.error});
}

final class AuthscussesState extends AuthState {
  final dynamic user;

  AuthscussesState({required this.user});
}

final class AuthfailureState extends AuthState {
  final String? message;

  AuthfailureState({required this.message});
}
