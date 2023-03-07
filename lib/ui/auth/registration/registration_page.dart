import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/ui/auth/registration/widgets/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const RegistrationForm(),
                Center(
                  child: Text.rich(
                    TextSpan(text: "Don't have an account? ", style: GoogleFonts.poppins(
                        color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                            text: 'Login', style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14, color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacementNamed("/login");
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
    );
  }
}