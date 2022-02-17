import 'package:flapkap/ui/views/orders_time_graph_screen.dart';
import 'package:flutter/material.dart';

import 'app/locator/locator.dart';

void main() {
  setupLocator();
  runApp(const TradingAnalytics());
}

class TradingAnalytics extends StatelessWidget {
  const TradingAnalytics({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OrdersTimeGraphScreen(),
    );
  }
}
