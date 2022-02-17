import 'package:flapkap/ui/shared/commonWidgets/drawer/drawer_Items.dart';
import 'package:flutter/material.dart';

import '../../../views/orders_main_numeric_metrics_screen.dart';
import '../../../views/orders_time_graph_screen.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            DrawerItems(
                icon: "assets/images/graphs.png",
                title: 'Analytics',
                press: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const OrdersMainNumericMetrics()));
                }),
            DrawerItems(
                icon: "assets/images/highlights.png",
                title: 'Highlights',
                press: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrdersTimeGraphScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
