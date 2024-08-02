import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  final String errorMsg;
  final void Function() tryAgain;

  const FailedWidget(
      {super.key, required this.errorMsg, required this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          errorMsg,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: tryAgain,
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
