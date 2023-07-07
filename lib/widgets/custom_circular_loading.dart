import 'package:flutter/material.dart';

class CustomCircularLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const CustomCircularLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : child;
  }
}
