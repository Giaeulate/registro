import 'package:flutter/material.dart';

class Transitions {
  Transitions({
    required this.context,
    required this.child,
    this.replacement = false,
    this.removeUntil = false,
    this.animationType = AnimationType.fadeIn,
    this.duration = const Duration(
      milliseconds: 450,
    ),
  }) {
    switch (animationType!) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  final BuildContext context;
  final Widget child;
  final bool? replacement;
  final bool? removeUntil;
  final AnimationType? animationType;
  final Duration? duration;

  void _pushPage(Route route) => Navigator.push(context, route);

  void _pushReplacement(Route route) =>
      Navigator.pushReplacement(context, route);

  void _pushAndRemoveUntil(Route route) =>
      Navigator.pushAndRemoveUntil(context, route, (route) => false);

  void _normalTransition() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => child,
        ),
      );

  void _fadeInTransition() {
    final PageRouteBuilder<dynamic> route = PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          child,
      transitionDuration: duration!,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
        child: child,
      ),
    );

    (removeUntil != null && removeUntil!)
        ? _pushAndRemoveUntil(route)
        : (replacement != null && replacement!)
            ? _pushReplacement(route)
            : _pushPage(route);
  }
}

enum AnimationType {
  normal,
  fadeIn,
}
