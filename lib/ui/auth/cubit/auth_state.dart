import 'package:equatable/equatable.dart';

enum AuthorizationStatus { initial, loading, complete, error }
enum AlertStatus { none, visibility }

class AuthState extends Equatable {
  final AuthorizationStatus status;
  final String errorMessage;
  final String email;
  final AlertStatus alertStatus;

  const AuthState({
    this.status = AuthorizationStatus.initial,
    this.errorMessage = '',
    this.email = '',
    this.alertStatus = AlertStatus.none,
  });

  AuthState copyWith({
    AuthorizationStatus? status,
    String? errorMessage,
    String? email,
    AlertStatus? alertStatus,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      alertStatus: alertStatus ?? this.alertStatus,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, email, alertStatus];
}