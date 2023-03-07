import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

// ignore: constant_identifier_names
enum AppButtonType { LOGIN, OUTLINE }

class AppButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final bool? enable;
  final AppButtonType? type;
  final bool? withShadow;
  final Widget? child;
  final BorderRadius? borderRadius;

  final bool? disableOnlyUI;

  const AppButton({
    Key? key,
    this.width = double.infinity,
    this.height = 40,
    this.onPressed,
    this.text,
    this.textColor,
    this.enable = true,
    this.type = AppButtonType.LOGIN,
    this.withShadow = true,
    this.child,
    this.borderRadius,
    this.disableOnlyUI = false,
  })  : assert(
  (child != null && text == null) || (child == null && text != null)),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      color: widget.type == AppButtonType.LOGIN ? AppColors.buttonColor : null,
      boxShadow: widget.withShadow! ? [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 8,
          offset: const Offset(0, 5),
        ),
      ] : null,
      // border: widget.type == AppButtonType.LOGIN
      //     ? Border.all(width: 2, color: Colors.white)
      //     : Border.all(color: Colors.transparent),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
    );
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 50.0, minHeight: 42.0),
          alignment: Alignment.center,
          decoration: decoration,
          width: widget.width,
          height: widget.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              widget.child != null
                  ? widget.child!
                  : Text(
                widget.text!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: (widget.enable! && !widget.disableOnlyUI!)
                      ? (widget.textColor ??
                      (widget.type == AppButtonType.LOGIN
                          ? Colors.white
                          : widget.type == AppButtonType.OUTLINE
                          ? Colors.white
                          : AppColors.navigationWidgetsColor))
                      : AppColors.inputDisabledTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.enable! ? widget.onPressed! : () {},
                  borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(12),
                  splashColor: (!widget.enable! || widget.disableOnlyUI!)
                      ? Colors.transparent
                      : widget.type == AppButtonType.LOGIN
                      ? Colors.white24
                      : AppColors.socialBorderColor.withOpacity(0.2),
                  highlightColor: (!widget.enable! || widget.disableOnlyUI!)
                      ? Colors.transparent
                      : widget.type == AppButtonType.LOGIN
                      ? Colors.white24
                      : AppColors.socialBorderColor.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}