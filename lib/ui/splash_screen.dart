import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startNavigateWithDelay();
    super.initState();
  }

  startNavigateWithDelay() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      BlocProvider.of<AuthenticationBloc>(context).add(AppLoaded());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: AppColors.backgroundColorApp,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset('assets/Logo.png', height: 60, width: 236),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.buttonColor,),
                ),
              ),
            ],
          ),
        ));
  }
}