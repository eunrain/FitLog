import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final String title;
  final String content;

  const ShowDialog({
    super.key,
    required this.title,
    required this.content,
  });

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
