import 'package:flutter/material.dart';

import 'e05_page_ui.dart';
import 'ui_tokens.dart';

class E04PageUI extends StatelessWidget {
  const E04PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignFrame(
      child: Stack(
        children: [
          const Positioned(left: 0, top: 0, width: 360, height: 313,
            child: OrangeHeader()),
          Positioned(left: 30, right: 20, top: 351, height: 32,
            child: Text('Forgot your password?',
              style: figmaText(size: 20, weight: FontWeight.w700)),
          ),
          Positioned(left: 30, right: 30, top: 382, height: 24,
            child: Text('Enter email address', style: figmaText(size: 16)),
          ),
          const Positioned(left: 30, top: 408, width: 300,
            child: InputBox(hint: '', keyboardType: TextInputType.emailAddress)),
          Positioned(left: 30, top: 479, width: 300, height: 51,
            child: OrangeButton(label: 'Send code', onPressed: () =>
              pushPage(context, const E05PageUI()))),
        ],
      ),
    );
  }
}
