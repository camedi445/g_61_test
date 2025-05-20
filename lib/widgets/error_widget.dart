import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  const ErrorDisplayWidget({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: Text('Error: $message'));
}