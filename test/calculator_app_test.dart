import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p0801/main.dart';
import 'package:p0801/operation.dart';
import 'package:p0801/operation_widget.dart';
import 'package:p0801/calculator.dart';

void main() {
  final calculator = Calculator();
  group('CalculatorApp', () {
    testWidgets("Render 4 widgets or Type ListTile", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(CalculatorApp());

      final listTileFinder = find.byType(ListTile);

      expect(listTileFinder, findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('show result when gives two numbers', (tester) async {
      await tester.pumpWidget(CalculatorApp());

      final topTextFieldFinder = find.byKey(Key('textField_top_Adding'));
      final bottomTextFieldFinder = find.byKey(Key('textField_bottom_Adding'));

      await tester.enterText(topTextFieldFinder, '3');
      await tester.enterText(bottomTextFieldFinder, '7');

      final textResultFinder = find.text('Result: 10');

      await tester.pumpAndSettle();
      expect(textResultFinder, findsOneWidget);
    });
  });

  group('Operation Widget', () {
    testWidgets('render 10 when 3 and 7 added', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OperationWidget(
              operation: Operation.add,
              calculator: calculator,
            ),
          ),
        ),
      );
      await tester.enterText(find.byKey(Key('textFiled_top_Adding')), '3');
      await tester.enterText(find.byKey(Key('textFiled_bottom_Adding')), '7');

      await tester.pumpAndSettle();

      expect(find.text('Result:10'), findsOneWidget);
    });
  });
}
