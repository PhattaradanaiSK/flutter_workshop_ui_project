import 'package:flutter/material.dart';

import 'e01_page_ui.dart';
import 'ui_tokens.dart';

class E06PageUI extends StatelessWidget {
  const E06PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignFrame(
      child: Stack(
        children: [
          const Positioned(left: 0, top: 0, width: 360, height: 313,
            child: OrangeHeader(showBack: false)),
          Positioned(left: 30, right: 20, top: 329, height: 32,
            child: Text('Create New Password',
              style: figmaText(size: 20, weight: FontWeight.w700)),
          ),
          Positioned(left: 30, right: 30, top: 360, height: 27,
            child: Text('Enter new password', style: figmaText(size: 16)),
          ),
          const Positioned(left: 30, top: 408, width: 300,
            child: InputBox(hint: 'Enter New password', obscureText: true)),
          const Positioned(left: 30, top: 464, width: 300,
            child: InputBox(hint: 'Confirm password', obscureText: true)),
          Positioned(
            left: 30, top: 535, width: 300, height: 51,
            child: OrangeButton(
              label: 'Submit',
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => const E01PageUI()),
                (_) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
