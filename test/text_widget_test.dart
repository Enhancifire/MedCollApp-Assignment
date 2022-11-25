import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medcollapp_assignment/pages/components/test_text.dart';

void main() {
  testWidgets('Testing the Column Text Custom Widget', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: "Flutter Test",
        home: Scaffold(
          body: Center(
            child: ColumnText(text: 'Text'),
          ),
        ),
      ),
    );

    final textFinder = find.text('Text');
    expect(textFinder, findsOneWidget);
  });
}
