import 'package:flutter/material.dart';

class ExpandedContainer extends StatelessWidget {
  const ExpandedContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: child ?? const SizedBox.shrink(),
    );
  }
}