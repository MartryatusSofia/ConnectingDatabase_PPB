import 'package:flutter_test/flutter_test.dart';
import 'package:ppb_koneksibilitas/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Koneksibilitas'), findsOneWidget);
  });
}
