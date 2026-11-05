import 'package:flutter/material.dart';

import 'e06_page_ui.dart';
import 'ui_tokens.dart';

class E05PageUI extends StatelessWidget {
  const E05PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignFrame(
      child: Stack(
        children: [
          Positioned(
            left: 50, top: 38, width: 260, height: 30,
            child: Text('OTP Verification', textAlign: TextAlign.center,
              style: figmaText(size: 20, weight: FontWeight.w700)),
          ),
          Positioned(left: 20, top: 36,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFFFFF3C0),
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 20,
                tooltip: 'Back',
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.chevron_left, color: kOrangeDark),
              ),
            ),
          ),
          Positioned(
            left: 35, top: 105, width: 290, height: 290,
            child: Image.asset('assets/images/img_orange3.png', fit: BoxFit.contain),
          ),
          Positioned(left: 30, top: 426, height: 30,
            child: Text('Enter OTP', style: figmaText(size: 20, weight: FontWeight.w700)),
          ),
          Positioned(
            left: 30, right: 30, top: 457, height: 42,
            child: Text('An 4 digit code has been sent to your\nemail',
              style: figmaText(size: 14, color: const Color(0xFF555555), height: 1.3)),
          ),
          Positioned(
            left: 30, top: 505, width: 300, height: 50,
            child: Row(
              children: List<Widget>.generate(4, (index) => Padding(
                padding: EdgeInsets.only(right: index == 3 ? 0 : 8),
                child: SizedBox(
                  width: 47,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: figmaText(size: 18, weight: FontWeight.w600),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xFFE3E3E3),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: kOrange),
                      ),
                    ),
                  ),
                ),
              )),
            ),
          ),
          Positioned(
            left: 20, right: 20, top: 570, height: 22,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: figmaText(size: 13, color: const Color(0xFF555555)),
                children: [
                  const TextSpan(text: 'You should recieve the OTP in '),
                  TextSpan(text: '30 Second', style: figmaText(size: 13, color: kOrangeDark)),
                ],
              ),
            ),
          ),
          Positioned(left: 30, top: 609, width: 300, height: 51,
            child: OrangeButton(label: 'Verify', onPressed: () =>
              pushPage(context, const E06PageUI()))),
        ],
      ),
    );
  }
}
