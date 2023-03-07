import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/main.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../data/app_data.dart';

class OauthInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains('/auth/login')) {
      options.headers["Authorization"] = 'Basic ' '<basic token>'; // add basic token here
    } else {
      final String? accessToken = await AppData.instance.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $accessToken";
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode == 401 && err.response == null){
      BlocProvider.of<AuthenticationBloc>(MyAppState.getContext()).add(LoggedOut());
    }
    return onError(err, handler);
  }
}