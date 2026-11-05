import 'dart:math' as math;

import 'package:flutter/material.dart';

const double designWidth = 360;
const double designHeight = 800;
const Color kOrange = Color(0xFFFF9C12);
const Color kOrangeDark = Color(0xFFF3940B);
const Color kInk = Color(0xFF111111);
const Color kMuted = Color(0xFF8B8B8B);
const Color kFieldBorder = Color(0xFF999999);

void pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
}

/// Keeps the Figma's 360 × 800 coordinate system while fitting a safe Android
/// viewport; screens remain touchable because FittedBox scales hit testing too.
class DesignFrame extends StatelessWidget {
  const DesignFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final scale = math.min(
              constraints.maxWidth / designWidth,
              constraints.maxHeight / designHeight,
            );
            return Center(
              child: SizedBox(
                width: designWidth * scale,
                height: designHeight * scale,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: designWidth,
                    height: designHeight,
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

TextStyle figmaText({
  double size = 14,
  Color color = kInk,
  FontWeight weight = FontWeight.w400,
  String family = 'Poppins',
  double? height,
}) {
  return TextStyle(
    fontFamily: family,
    fontSize: size,
    color: color,
    fontWeight: weight,
    height: height,
  );
}

class OrangeHeader extends StatelessWidget {
  const OrangeHeader({super.key, this.showBack = true});

  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/img_orange2.png', fit: BoxFit.fill),
        ),
        if (showBack)
          Positioned(
            left: 20,
            top: 36,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white.withValues(alpha: 0.58),
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 20,
                tooltip: 'Back',
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

class OrangeButton extends StatelessWidget {
  const OrangeButton({super.key, required this.label, required this.onPressed,
    this.fontSize = 20, this.fontFamily = 'Poppins'});

  final String label;
  final VoidCallback? onPressed;
  final double fontSize;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [kOrangeDark, kOrange],
            ),
          ),
          child: Center(
            child: Text(label, style: figmaText(
              size: fontSize,
              color: Colors.white,
              weight: FontWeight.w700,
              family: fontFamily,
            )),
          ),
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.hint, this.obscureText = false,
    this.keyboardType, this.controller, this.showEye = false,
    this.textAlign = TextAlign.start, this.maxLength});

  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool showEye;
  final TextAlign textAlign;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        textAlign: textAlign,
        style: figmaText(size: 12, color: kInk),
        decoration: InputDecoration(
          counterText: '',
          hintText: hint,
          hintStyle: figmaText(size: 12, color: kMuted),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          suffixIcon: showEye
              ? const Icon(Icons.visibility_off_outlined, color: kMuted, size: 20)
              : null,
          suffixIconConstraints: const BoxConstraints(minWidth: 42, minHeight: 42),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kFieldBorder, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kOrange, width: 1.4),
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: kOrange, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('OR', style: figmaText(size: 18, weight: FontWeight.w500)),
        ),
        const Expanded(child: Divider(color: kOrange, thickness: 1)),
      ],
    );
  }
}

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/img_g.png', width: 32, height: 32),
        const SizedBox(width: 30),
        Image.asset('assets/images/img_f.png', width: 32, height: 32),
        const SizedBox(width: 30),
        Image.asset('assets/images/img_a.png', width: 32, height: 32),
      ],
    );
  }
}

Widget inlineLink(String text, {VoidCallback? onTap, double size = 12}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: Text(text, style: figmaText(size: size, color: kOrangeDark)),
  );
}
