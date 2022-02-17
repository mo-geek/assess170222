import 'package:flutter/material.dart';

class AnimatedNumericMetricProgress extends StatefulWidget {
  final Widget Function(double animatedValue) animatedWidgetFunction;

  const AnimatedNumericMetricProgress(this.animatedWidgetFunction, {Key? key})
      : super(key: key);

  @override
  State<AnimatedNumericMetricProgress> createState() =>
      _AnimatedNumericMetricProgressState();
}

class _AnimatedNumericMetricProgressState
    extends State<AnimatedNumericMetricProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startAnimation() {
    Future.delayed(const Duration(milliseconds: 300))
        .whenComplete(() => _animationController.forward());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return widget.animatedWidgetFunction(_animation.value);
        });
  }
}
