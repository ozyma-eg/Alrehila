import 'package:flutter/material.dart';

class SearchLists extends StatelessWidget {
  final String? pageName;
  final String name;

  const SearchLists({
    super.key,
    required this.name,
    this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
    );
  }
}
