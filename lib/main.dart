import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/providers/providers.dart';
import 'package:test_project/ui/auth/login/login_page.dart';
import 'package:test_project/ui/auth/registration/registration_page.dart';
import 'package:test_project/ui/main/main_page.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/auth/auth_state.dart';
import 'network/server_api.dart';
import 'ui/splash_screen.dart';

void main() async{
  final RestClient client = RestClient(baseUrl: "https://fakestoreapi.com");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiRepositoryProvider(
    providers: getRepositories(client),
    child: MultiBlocProvider(providers: getProviders(client), child: const MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static BuildContext? _context;
  static BuildContext getContext() {
    return _context!;
  }

  @override
  void initState() {
    super.initState();
    _context = context;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Test Project',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              canvasColor: Colors.transparent,
            ),
            home: Stack(
              children: [
                navigateToHomeWidget(state),
              ],
            ),
            routes: <String, WidgetBuilder>{
              '/login': (_) => const LoginPage(), // Home Page
              '/register': (_) => const RegistrationPage(), // The SignUp page
            },
          );
        });
  }

  Widget navigateToHomeWidget(AuthenticationState state) {
    switch (state.status) {
      case AuthenticationStatus.loading:
        return const SplashScreen();
      case AuthenticationStatus.authenticated:
        return const MainPage();
      case AuthenticationStatus.unauthenticated:
        return const LoginPage();
      default: return const LoginPage();
    }
  }
}