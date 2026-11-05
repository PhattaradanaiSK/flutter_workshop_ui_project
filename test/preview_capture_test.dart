import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workshop_ui_project/main.dart';

Future<void> _loadAppFonts() async {
  final poppins = FontLoader('Poppins')
    ..addFont(rootBundle.load('assets/fonts/Poppins-Regular.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Poppins-Medium.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Poppins-SemiBold.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Poppins-Bold.ttf'));
  final roboto = FontLoader('Roboto')
    ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Roboto-Medium.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'));
  final materialIcons = FontLoader('MaterialIcons')
    ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
  await poppins.load();
  await roboto.load();
  await materialIcons.load();
}

void main() {
  testWidgets('capture actual Flutter UI previews', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await _loadAppFonts();
    Future<void> capture(String name) async {
      await expectLater(
        find.byKey(const ValueKey<String>('actual-flutter-preview')),
        matchesGoldenFile('previews/$name.png'),
      );
    }

    await tester.pumpWidget(
      const RepaintBoundary(
        key: ValueKey<String>('actual-flutter-preview'),
        child: OrangeApp(),
      ),
    );
    await tester.pumpAndSettle();

    final imageContext = tester.element(find.byType(Scaffold));
    await tester.runAsync(() async {
      for (final asset in <String>[
        'assets/images/img_orange1.png',
        'assets/images/img_orange2.png',
        'assets/images/img_orange3.png',
        'assets/images/img_g.png',
        'assets/images/img_f.png',
        'assets/images/img_a.png',
      ]) {
        await precacheImage(AssetImage(asset), imageContext);
      }
    });
    await tester.pumpAndSettle();
    await capture('e01_welcome');

    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();
    await capture('e02_login');

    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();
    await capture('e03_register');

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Forgot Password ?'));
    await tester.pumpAndSettle();
    await capture('e04_forgot_password');

    await tester.tap(find.text('Send code'));
    await tester.pumpAndSettle();
    await capture('e05_otp');

    await tester.tap(find.text('Verify'));
    await tester.pumpAndSettle();
    await capture('e06_new_password');
  });
}
