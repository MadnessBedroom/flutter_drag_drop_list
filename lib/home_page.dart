import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List items = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];

  List<Widget> _renderList() {
    return items
        .map(
          (e) => Container(
            alignment: Alignment.center,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10),
            key: ValueKey(e),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(e),
          ),
        )
        .toList();
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      final tile = items.removeAt(oldIndex);
      items.insert(newIndex, tile);
      // print(oldIndex);
      // print(newIndex);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Drag Drop List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ReorderableListView(
          padding: const EdgeInsets.all(10),
          onReorder: (oldIndex, newIndex) => onReorder(oldIndex, newIndex),
          children: _renderList(),
        ),
      ),
    );
  }
} //
