import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/validation/form_validation.dart';
import '../../../../utils/widgets/app_alert_dialog.dart';
import '../../../../utils/widgets/app_button.dart';
import '../../cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FormValidation formValidation = FormValidation();
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _passwordSecure = true;

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 52.0),
              child: Center(child: Image.asset('assets/Logo.png', height: 60, width: 236)),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Color(0xFF9D9D9D)),
              controller: _usernameTextController,
              validator: (value) => FormValidation.email(value!),
              decoration:
              InputDecoration(
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF158A8A), width: 2)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF158A8A), width: 2)),
                  labelText: 'User name',
                  labelStyle: GoogleFonts.sourceSansPro(color: const Color(0xFF9D9D9D), fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(left: 8),
                  enabled: true),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              onFieldSubmitted: (_) {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context).logIn(
                      _usernameTextController.value.text,
                      _passwordTextController.value.text);
                }
              },
              obscureText: _passwordSecure,
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Color(0xFF9D9D9D)),
              controller: _passwordTextController,
              validator: (value) => formValidation.password(value!),
              decoration: InputDecoration(
                  suffixIcon: Align(
                    widthFactor: 1.2,
                    child: IconButton(
                        icon: Icon(
                            _passwordSecure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF9D9D9D)),
                        onPressed: () {
                          setState(() {
                            _passwordSecure = !_passwordSecure;
                          });
                        }),
                  ),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF158A8A), width: 2)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF158A8A), width: 2)),
                  labelText: 'Password',
                  labelStyle: GoogleFonts.sourceSansPro(color: const Color(0xFF9D9D9D), fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(left: 8),
                  enabled: true),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: 'Forgot password',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF158A8A),
                              fontWeight: FontWeight.w400
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    barrierColor: Colors.black.withOpacity(0.6),
                                    opaque: false,
                                    pageBuilder: (context, _, __) => AppAlertDialog(context, 'Sorry', 'but this feature is currently unavailable!')));
                              })
                      ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 62.0),
              child: AppButton(
                withShadow: false,
                height: 48,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).logIn(
                        _usernameTextController.value.text,
                        _passwordTextController.value.text);
                  }
                },
                textColor: Colors.white,
                text: 'Log In',
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}