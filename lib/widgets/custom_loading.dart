import 'package:flutter/material.dart';
import 'custom_circular_loading.dart';

class CustomLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const CustomLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    // return CustomLoadingPlaceholder(
    return CustomCircularLoading(
      isLoading: isLoading,
      child: child,
    );
  }
}
