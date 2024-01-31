import 'package:flutter/material.dart';

class PackageText extends StatefulWidget {
  const PackageText({super.key});

  @override
  State<PackageText> createState() => _PackageTextState();
}

class _PackageTextState extends State<PackageText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'done',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
