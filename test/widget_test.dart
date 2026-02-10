import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_cie/main.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {
    await tester.pumpWidget(const PetShopApp());

    expect(find.text('Pet Shop'), findsOneWidget);
    expect(find.text('Dogs'), findsOneWidget);
  });
}
