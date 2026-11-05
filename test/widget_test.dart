import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop_ui_project/main.dart';
import 'package:flutter_workshop_ui_project/screens/e01_page_ui.dart';
import 'package:flutter_workshop_ui_project/screens/e02_page_ui.dart';
import 'package:flutter_workshop_ui_project/screens/e03_page_ui.dart';
import 'package:flutter_workshop_ui_project/screens/e04_page_ui.dart';
import 'package:flutter_workshop_ui_project/screens/e05_page_ui.dart';
import 'package:flutter_workshop_ui_project/screens/e06_page_ui.dart';

void main() {
  testWidgets('all six design screens and primary navigation work', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const OrangeApp());
    await tester.pumpAndSettle();
    expect(find.text('BERRY JUICE'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);

    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();
    expect(find.text('Register'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Forgot Password ?'));
    await tester.pumpAndSettle();
    expect(find.text('Forgot your password?'), findsOneWidget);

    await tester.tap(find.text('Send code'));
    await tester.pumpAndSettle();
    expect(find.text('OTP Verification'), findsOneWidget);

    await tester.tap(find.text('Verify'));
    await tester.pumpAndSettle();
    expect(find.text('Create New Password'), findsOneWidget);

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();
    expect(find.text('BERRY JUICE'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('all screens render on Android and iPhone-sized viewports without overflow',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    const sizes = <Size>[
      Size(360, 800),
      Size(390, 844),
      Size(412, 915),
      Size(430, 932), // iPhone 15 Pro Max logical screen size
    ];
    final pages = <Widget>[
      const E01PageUI(),
      const E02PageUI(),
      const E03PageUI(),
      const E04PageUI(),
      const E05PageUI(),
      const E06PageUI(),
    ];

    for (final size in sizes) {
      tester.view.physicalSize = size;
      for (final page in pages) {
        await tester.pumpWidget(MaterialApp(
          theme: ThemeData(fontFamily: 'Poppins'),
          home: page,
        ));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull,
            reason: '${page.runtimeType} on $size');
      }
    }
  });
}
