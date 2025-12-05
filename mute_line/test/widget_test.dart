import 'package:mute_line/mute_line_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MuteLine app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MuteLineApp());
  });
}
