import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/core/functions/public_functions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImpolicitAnimationWidgets extends StatelessWidget {
  ImpolicitAnimationWidgets({super.key});
  ValueNotifier<double> valueNotifier = ValueNotifier(100);
  bool isChange = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetContainer(valueNotifier: valueNotifier),
            customSizedBOxFromHeight(40),
            MaterialButton(
              onPressed: () {
                valueNotifier.value * 2;
              },
              animationDuration: const Duration(microseconds: 200),
              color: Colors.amber,
              child: Text('Cahnge'),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetContainer extends StatefulWidget {
  const WidgetContainer({super.key, required this.valueNotifier});
  final ValueNotifier<double> valueNotifier;
  @override
  State<WidgetContainer> createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: 1000),
      duration: const Duration(milliseconds: 2000),
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: AppStyle.boldAND30SizeStyle,
        );
      },
    );
  }
}
