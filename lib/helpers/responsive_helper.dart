import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  const ResponsiveWidget(
      {super.key, required this.mobile, required this.tablet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraints) {
        if (constraints.maxWidth < 760) {
          return mobile;
        } else {
          return tablet;
        }
      },
    );
  }
}
