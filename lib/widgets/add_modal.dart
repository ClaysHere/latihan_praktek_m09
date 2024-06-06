import 'package:flutter/material.dart';

class AddModal extends StatefulWidget {
  const AddModal({super.key});

  @override
  State<AddModal> createState() => _AddModalState();
}

class _AddModalState extends State<AddModal> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
