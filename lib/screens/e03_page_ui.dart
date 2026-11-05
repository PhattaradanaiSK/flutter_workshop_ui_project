import 'package:flutter/material.dart';

import 'e02_page_ui.dart';
import 'ui_tokens.dart';

class E03PageUI extends StatelessWidget {
  const E03PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignFrame(
      child: SingleChildScrollView(
        child: SizedBox(
          width: designWidth,
          height: 910,
          child: Stack(
            children: [
              const Positioned(left: 0, top: 0, width: 360, height: 313,
                child: OrangeHeader()),
              Positioned(left: 0, right: 0, top: 316, height: 40,
                child: Text('Register', textAlign: TextAlign.center,
                  style: figmaText(size: 30, weight: FontWeight.w700)),
              ),
              Positioned(left: 0, right: 0, top: 357, height: 28,
                child: Text('Create your new account', textAlign: TextAlign.center,
                  style: figmaText(size: 18)),
              ),
              const Positioned(left: 30, top: 408, width: 300,
                child: InputBox(hint: 'Name')),
              const Positioned(left: 30, top: 464, width: 300,
                child: InputBox(hint: 'E-mail', keyboardType: TextInputType.emailAddress)),
              const Positioned(left: 30, top: 520, width: 300,
                child: InputBox(hint: 'Phone', keyboardType: TextInputType.phone)),
              const Positioned(left: 30, top: 576, width: 300,
                child: InputBox(hint: 'Password', obscureText: true)),
              Positioned(
                left: 18, right: 18, top: 636, height: 36,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text('By signing up you agree to our ', style: figmaText(size: 12)),
                    inlineLink('Terms & Conditions', size: 12),
                    Text(' and ', style: figmaText(size: 12)),
                    inlineLink('Privacy Policy', size: 12),
                  ],
                ),
              ),
              Positioned(left: 30, top: 680, width: 300, height: 50,
                child: OrangeButton(label: 'Sign Up', onPressed: () {})),
              const Positioned(left: 30, right: 30, top: 748, height: 28,
                child: OrDivider()),
              const Positioned(left: 30, right: 30, top: 790,
                child: SocialAuthRow()),
              Positioned(
                left: 12, right: 12, top: 854, height: 24,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('Already have an Account? ', style: figmaText(size: 12)),
                    inlineLink('Log In', onTap: () => pushPage(context, const E02PageUI()), size: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
