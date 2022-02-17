import 'package:flapkap/core/viewmodels/orders_highlights_viewmodel.dart';
import 'package:flapkap/ui/shared/commonViews/numericHighlights/numeric_highlights.dart';
import 'package:flapkap/ui/shared/commonWidgets/animated_numeric_metrics_progress.dart';
import 'package:flapkap/ui/shared/commonWidgets/no_data_found.dart';
import 'package:flapkap/ui/shared/commonWidgets/order_netrics_card.dart';
import 'package:flapkap/ui/shared/commonwidgets/header.dart';
import 'package:flapkap/ui/shared/responsive/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../shared/commonwidgets/drawer/drawer.dart';

class OrdersMainNumericMetrics extends StatelessWidget {
  const OrdersMainNumericMetrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<OrdersHighlightsViewModel>.reactive(
        onModelReady: (OrdersHighlightsViewModel vm) {},
        onDispose: (OrdersHighlightsViewModel vm) {
          vm.scaffoldKey.currentState?.dispose();
        },
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
            key: model.scaffoldKey,
            drawer:
                SizedBox(width: size.width * 0.6, child: const DrawerView()),
            drawerEdgeDragWidth: 150.0,
            body: SafeArea(
              child: Row(
                children: [
                  if (!Responsive.isMobile(context) ||
                      Responsive.isMobileLandscape(context))
                    Expanded(
                      flex: Responsive.isMobileLandscape(context) ? 2 : 1,
                      child: Container(
                        color: Colors.white,
                        child: const DrawerView(),
                      ),
                    ),
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (!Responsive.isMobile(context))
                            Header(
                                press: model.showDrawer,
                                edgeInsetsGeometry: const EdgeInsets.only(
                                    left: 12.0, right: 8.0, bottom: 8.0)),
                          if (Responsive.isMobile(context))
                            Header(
                                press: model.showDrawer,
                                edgeInsetsGeometry: const EdgeInsets.only(
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 8.0)),
                          FutureBuilder(
                            future: model.getOrdersList(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      AnimatedNumericMetricProgress(
                                          (animatedValue) => NumericMetricsCard(
                                              OrderMetricsCard(
                                                  (model.ordersTotalCount *
                                                              animatedValue)
                                                          .toStringAsFixed(2) +
                                                      ' 🧾',
                                                  'Total Number Of Orders'))),
                                      AnimatedNumericMetricProgress(
                                          (animatedValue) => NumericMetricsCard(
                                              OrderMetricsCard(
                                                  (model.ordersAveragePrice *
                                                              animatedValue)
                                                          .toStringAsFixed(2) +
                                                      ' \$',
                                                  'Average Revenue Per Order'))),
                                      AnimatedNumericMetricProgress(
                                        (animatedValue) => NumericMetricsCard(
                                            OrderMetricsCard(
                                                (model.returnedOrdersNum *
                                                            animatedValue)
                                                        .toStringAsFixed(2) +
                                                    ' ﹪',
                                                'Returned Orders')),
                                      ),
                                    ]),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                debugPrint('${snapshot.error}');
                                return const NoDataFound(
                                    'Error occurs, please try again later...');
                              } else {
                                return Container(
                                  color: Colors.blue,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        viewModelBuilder: () => OrdersHighlightsViewModel());
  }
}
