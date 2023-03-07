import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/data/models/repositories/product_repository.dart';
import 'package:test_project/ui/auth/cubit/auth_cubit.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../data/models/repositories/user_repository.dart';
import '../network/server_api.dart';
import '../ui/main/cubit/main_cubit.dart';

getRepositories(RestClient client) {
  return [
    RepositoryProvider<UserRepository>(create: (context) => UserRepository(client)),
    RepositoryProvider<ProductRepository>(create: (context) => ProductRepository(client)),
  ];
}

getProviders(RestClient client) {
  return [
    BlocProvider(create: (context) => AuthenticationBloc(UserRepository(client))..add(AppStarted())),
    BlocProvider(create: (context) => AuthCubit(UserRepository(client))),
    BlocProvider(create: (context) => MainCubit(ProductRepository(client))),
  ];
}