import 'package:flutter/material.dart';

class NumericMetricsCard extends StatelessWidget {
  final Widget child;

  const NumericMetricsCard(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
          boxShadow: true
              ? [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ]
              : null),
      child: Center(child: child),
    );
  }
}
