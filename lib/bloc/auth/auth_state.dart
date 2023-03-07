import 'package:equatable/equatable.dart';

enum AuthenticationStatus{ uninitialized, loading, authenticated, unauthenticated }
enum InternetConnection { none, connect, notConnect }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final String token;
  final InternetConnection internetConnection;

  const AuthenticationState({
    this.status = AuthenticationStatus.uninitialized,
    this.token = '',
    this.internetConnection = InternetConnection.none,
  });

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    String? token,
    InternetConnection? internetConnection,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      token: token ?? this.token,
      internetConnection: internetConnection ?? this.internetConnection,
    );
  }
  @override
  List<Object> get props => [status, token, internetConnection];
}