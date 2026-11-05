import 'package:flutter/material.dart';

import 'e02_page_ui.dart';
import 'ui_tokens.dart';

class E01PageUI extends StatelessWidget {
  const E01PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignFrame(
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 0,
            width: 320,
            height: 460,
            child: Image.asset('assets/images/img_orange1.png', fit: BoxFit.fill),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 486,
            height: 48,
            child: Text(
              'BERRY JUICE',
              textAlign: TextAlign.center,
              style: figmaText(size: 36, weight: FontWeight.w700, family: 'Roboto'),
            ),
          ),
          Positioned(
            left: 25,
            right: 25,
            top: 558,
            height: 46,
            child: Text(
              'A Moments of healthy sip\nThe best vitamin for your health',
              textAlign: TextAlign.center,
              style: figmaText(size: 14, weight: FontWeight.w500, family: 'Roboto', height: 1.25),
            ),
          ),
          Positioned(
            left: 40,
            top: 690,
            width: 280,
            height: 50,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () => pushPage(context, const E02PageUI()),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: [kOrangeDark, kOrange],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Explore Now', style: figmaText(
                          size: 18,
                          color: Colors.white,
                          weight: FontWeight.w700,
                          family: 'Roboto',
                        )),
                        const Spacer(),
                        const Icon(Icons.chevron_right, color: Colors.white, size: 34),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
