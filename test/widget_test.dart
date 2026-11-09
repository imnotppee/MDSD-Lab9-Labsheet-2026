// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:campus_marketplace/main.dart';

void main() {
  testWidgets('หน้าตั้งค่า Firebase แสดงคำแนะนำ', (tester) async {
    await tester.pumpWidget(const FirebaseSetupApp());
    expect(find.text('ต้องเชื่อม Firebase ก่อน'), findsOneWidget);
    expect(find.textContaining('flutterfire configure'), findsWidgets);
  });
}
