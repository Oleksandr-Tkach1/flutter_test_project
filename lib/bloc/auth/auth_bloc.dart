import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/main.dart';
import '../../data/models/repositories/user_repository.dart';
import '../../ui/auth/cubit/auth_cubit.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository) : super(const AuthenticationState(status: AuthenticationStatus.uninitialized)){
    on<AppStarted>((event, emit) async{
      emit(state.copyWith(status: AuthenticationStatus.loading));
    });
    on<AppLoaded>((event, emit) async{
      final String? accessToken = await _userRepository.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        emit(state.copyWith(status: AuthenticationStatus.authenticated, token: accessToken));
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated, token: ''));
      }
    });
    on<LoggedOut>((event, emit) async{
      clearAppData(MyAppState.getContext());
      emit(state.copyWith(
        status: AuthenticationStatus.unauthenticated,
        token: '',
      ));
    });
    on<LoggedIn>((event, emit) async{
      emit(state.copyWith(
        status: AuthenticationStatus.authenticated,
      ));
    });
  }

  void clearAppData(BuildContext context) {
    _userRepository.removeAccessData();
    BlocProvider.of<AuthCubit>(context).clearState();
    // clear other states here if needed
  }

  void logout(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
  }
}