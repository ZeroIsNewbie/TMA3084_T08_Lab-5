import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'category.dart';
import 'drawer.dart';
import 'home.dart';
import 'information.dart';
import 'providers/navigation_provider.dart';
import 'records.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MyApp does not listen to the provider, so MaterialApp is built once.
    return const MaterialApp(home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // Order must match the indices in NavigationIndex.
  static const List<Widget> _pages = [
    Center(child: Home()),
    Center(child: Information()),
    StudentRecordDataTable(),
    Category(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'StudentHub',
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
      drawer: AppDrawer(
        onItemSelected: (index) =>
            context.read<NavigationProvider>().changeIndex(index),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pinkAccent,
        selectedItemColor: Colors.white,
        selectedFontSize: 19.0,
        unselectedFontSize: 14.0,
        iconSize: 30.0,
        // Drawer-only pages (Category, About) fall back to the first tab,
        // exactly as in the original UI.
        currentIndex: currentIndex < NavigationIndex.bottomBarCount
            ? currentIndex
            : NavigationIndex.home,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Records'),
        ],
        onTap: (index) => context.read<NavigationProvider>().changeIndex(index),
      ),
    );
  }
}
