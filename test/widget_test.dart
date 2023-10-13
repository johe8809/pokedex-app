import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex_app/src/app.dart';

void main() {
  testWidgets('App', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
  });
}
