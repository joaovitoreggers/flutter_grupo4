import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  InfoBox({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              message!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
    ),
);
}
}