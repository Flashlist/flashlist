import 'package:flashlist_flutter/src/features/home/presentation/side_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  /// HomeScreen is the default screen when the user is authenticated
  /// Holds no [state], only UI.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
      ),
      drawer: const SideDrawer(),
      body: const Column(
        children: [
          Center(
            child: Text('Welcome!'),
          ),
        ],
      ),
    );
  }
}
