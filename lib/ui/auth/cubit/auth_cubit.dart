import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:test_project/data/models/repositories/user_repository.dart';
import '../../../data/app_data.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository _userRepository;
  AuthCubit(this._userRepository) : super(const AuthState());

  logIn(String username, String password) {
    emit(state.copyWith(status: AuthorizationStatus.loading, alertStatus: AlertStatus.none));
    return _userRepository.postUser(username, password).then((value) {
      AppData.instance.saveToken(value.token ?? '');
      emit(state.copyWith(status: AuthorizationStatus.complete));
    }).catchError((Object obj) {
          switch (obj.runtimeType) {
            case DioError: statusFunction(obj);
          }
        });
  }

  statusFunction(var obj) {
    if (obj.response == null) {
      return emit(state.copyWith(
        alertStatus: AlertStatus.visibility,
        status: AuthorizationStatus.error,
        errorMessage: 'Something went wrong, please try later ${obj.response}',
      ));
    } else if (obj.response!.statusCode == 401) {
      return emit(state.copyWith(
        alertStatus: AlertStatus.visibility,
        status: AuthorizationStatus.error,
        errorMessage: 'Something went wrong, please try later ${obj.response}',
      ));
    } else {
      return emit(state.copyWith(alertStatus: AlertStatus.none));
    }
  }

  void clearState() {
    emit(state.copyWith(
      email: '',
      status: AuthorizationStatus.initial,
    ));
  }
}