import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:lab_5/main.dart';
import 'package:lab_5/providers/navigation_provider.dart';

void main() {
  group('NavigationProvider', () {
    test('starts on the home page', () {
      expect(NavigationProvider().currentIndex, NavigationIndex.home);
    });

    test('notifies listeners only when the index changes', () {
      final provider = NavigationProvider();
      var notifications = 0;
      provider.addListener(() => notifications++);

      provider.changeIndex(NavigationIndex.records);
      provider.changeIndex(NavigationIndex.records);

      expect(provider.currentIndex, NavigationIndex.records);
      expect(notifications, 1);
    });

    test('ignores out-of-range indices', () {
      final provider = NavigationProvider();

      provider.changeIndex(-1);
      provider.changeIndex(NavigationIndex.pageCount);

      expect(provider.currentIndex, NavigationIndex.home);
    });
  });

  group('Navigation UI', () {
    Widget buildApp() => ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MyApp(),
    );

    testWidgets('bottom bar switches to Records', (tester) async {
      await tester.pumpWidget(buildApp());

      await tester.tap(find.text('Records'));
      await tester.pumpAndSettle();

      expect(find.text('Student Records'), findsOneWidget);
    });

    testWidgets('drawer opens Category and About', (tester) async {
      await tester.pumpWidget(buildApp());

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Category'));
      await tester.pumpAndSettle();
      expect(find.text('Software Engineering'), findsWidgets);

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();
      expect(find.text('Student Management Application'), findsOneWidget);
    });
  });
}
