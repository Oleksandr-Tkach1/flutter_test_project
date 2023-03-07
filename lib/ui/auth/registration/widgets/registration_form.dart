import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/validation/form_validation.dart';
import '../../../../utils/widgets/app_alert_dialog.dart';
import '../../../../utils/widgets/app_button.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);
  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  FormValidation formValidation = FormValidation();
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  bool _passwordSecure = true;
  bool _confirmPasswordSecure = true;
  bool isChecked = false;

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Center(child: Image.asset('assets/Logo.png', height: 60, width: 236)),),
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
              onFieldSubmitted: (v){
                FocusScope.of(context).nextFocus();
              },
              textInputAction: TextInputAction.next,
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
            const SizedBox(height: 16.0),
            TextFormField(
              onFieldSubmitted: (v){
                FocusScope.of(context).unfocus();
                if(_formKey.currentState!.validate()) {
                  Navigator.of(context).push(PageRouteBuilder(
                      barrierColor: Colors.black.withOpacity(0.6),
                      opaque: false,
                      pageBuilder: (context, _, __) => AppAlertDialog(context, 'Sorry', 'but this feature is currently unavailable!')));
                }
              },
              focusNode: focus,
              textInputAction: TextInputAction.done,
              obscureText: _confirmPasswordSecure,
              style: const TextStyle(color: Color(0xFF9D9D9D)),
              controller: _confirmPasswordTextController,
              validator: (value) => formValidation.confirmPassword(value!),
              decoration: InputDecoration(
                  suffixIcon: Align(
                    widthFactor: 1.2,
                    child:
                    IconButton(
                        icon: Icon(
                            _confirmPasswordSecure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF9D9D9D)),
                        onPressed: () {
                          setState(() {
                            _confirmPasswordSecure = !_confirmPasswordSecure;
                          });
                        }),
                  ),

                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF158A8A), width: 2)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF158A8A), width: 2)),
                  labelText: 'Confirm Password',
                  labelStyle: GoogleFonts.sourceSansPro(color: const Color(0xFF9D9D9D), fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.only(left: 8),
                  enabled: true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42, bottom: 62.0),
              child: AppButton(
                withShadow: false,
                height: 48,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(PageRouteBuilder(
                        barrierColor: Colors.black.withOpacity(0.6),
                        opaque: false,
                        pageBuilder: (context, _, __) => AppAlertDialog(context, 'Sorry', 'but this feature is currently unavailable!')));
                  }
                },
                textColor: Colors.white,
                text: 'Create',
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}