import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/ui/auth/login/widgets/login_form.dart';
import 'package:test_project/utils/colors.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.alertStatus == AlertStatus.visibility) {
          ///TODO
          return;
        } else if (state.status == AuthorizationStatus.complete) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          return;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColorApp,
        body: Center(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LoginForm(),
                  Center(
                    child: Text.rich(
                      TextSpan(text: "Don't have an account? ", style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                              text: 'Register', style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14, color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacementNamed("/register");
                                }
                          )],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}