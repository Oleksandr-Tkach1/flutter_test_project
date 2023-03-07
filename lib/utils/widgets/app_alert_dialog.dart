import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';

// ignore: non_constant_identifier_names
Widget AppAlertDialog(BuildContext context, String titleErrorMessage, String errorMessage){
  return AlertDialog(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
    backgroundColor: AppColors.iconColor,
    contentPadding: const EdgeInsets.only(top: 24),
    content: Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text(titleErrorMessage, style: GoogleFonts.sourceSansPro(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700))),
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              height: 62,
              child: Text(errorMessage,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSansPro(color: Colors.black, fontSize: 14)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Divider(color: Color(0xFF757575), height: 0,),
            ),
            SizedBox(
              height: 52,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                  onTap: () => Navigator.pop(context, 'Ok'),
                  child: const Center(
                    child: Text("Ok", style: TextStyle(color: AppColors.buttonColor, fontWeight: FontWeight.w700,), textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}