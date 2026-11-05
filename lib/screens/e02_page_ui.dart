import 'package:flutter/material.dart';

import 'e03_page_ui.dart';
import 'e04_page_ui.dart';
import 'ui_tokens.dart';

class E02PageUI extends StatelessWidget {
  const E02PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignFrame(
      child: Stack(
        children: [
          const Positioned(left: 0, top: 0, width: 360, height: 313,
            child: OrangeHeader()),
          Positioned(
            left: 0, right: 0, top: 316, height: 45,
            child: Text('Welcome back', textAlign: TextAlign.center,
              style: figmaText(size: 30, weight: FontWeight.w700)),
          ),
          Positioned(
            left: 0, right: 0, top: 365, height: 28,
            child: Text('Login to your account', textAlign: TextAlign.center,
              style: figmaText(size: 18, weight: FontWeight.w400)),
          ),
          const Positioned(left: 30, top: 408, width: 300,
            child: InputBox(hint: 'Enter email or phone', keyboardType: TextInputType.emailAddress)),
          const Positioned(left: 30, top: 464, width: 300,
            child: InputBox(hint: 'Password', obscureText: true, showEye: true)),
          Positioned(
            right: 30, top: 525, height: 20,
            child: inlineLink('Forgot Password ?',
              onTap: () => pushPage(context, const E04PageUI())),
          ),
          Positioned(left: 30, top: 567, width: 300, height: 50,
            child: OrangeButton(label: 'Log In', onPressed: () {})),
          const Positioned(left: 30, right: 30, top: 640, height: 28,
            child: OrDivider()),
          const Positioned(left: 30, right: 30, top: 682,
            child: SocialAuthRow()),
          Positioned(
            left: 15, right: 15, top: 724, height: 48,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Don't have an Account? ", style: figmaText(size: 12)),
                inlineLink('Create Account',
                  onTap: () => pushPage(context, const E03PageUI()), size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
