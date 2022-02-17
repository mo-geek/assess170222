import 'package:flapkap/core/models/orders_sum_over_time.dart';
import 'package:flapkap/core/viewmodels/orders_over_time_viewmodel.dart';
import 'package:flapkap/ui/shared/commonViews/ordersTable/orders_table.dart';
import 'package:flapkap/ui/shared/commonWidgets/no_data_found.dart';
import 'package:flapkap/ui/shared/responsive/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/constants/constants.dart';
import '../shared/commonwidgets/drawer/drawer.dart';
import '../shared/commonwidgets/header.dart';

class OrdersTimeGraphScreen extends StatelessWidget {
  const OrdersTimeGraphScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder<OrdersOverTimeViewModel>.reactive(
        onModelReady: (OrdersOverTimeViewModel vm) {
          vm.initState();
        },
        onDispose: (OrdersOverTimeViewModel vm) {
          vm.scaffoldKey.currentState?.dispose();
        },
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
            key: model.scaffoldKey,
            drawer:
                SizedBox(width: size.width * 0.6, child: const DrawerView()),
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
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50.0),
                            child: SingleChildScrollView(
                              child: FutureBuilder(
                                future: model.getOrdersList(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    final dataSet = model.generateDataSets();
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Center(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    'How many orders trading does Flapkap have '
                                                    'in ${model.ordersList.ordersList?.first.registerDate?.year} ?',
                                                    style: Constants
                                                        .defaultTextStyle1()),
                                              ),
                                              Container(
                                                  color: Colors.white,
                                                  child: SfCartesianChart(
                                                      primaryXAxis:
                                                          DateTimeAxis(),
                                                      series: <ChartSeries>[
                                                        // Renders line chart
                                                        LineSeries<DataSet,
                                                                DateTime>(
                                                            animationDuration:
                                                                2.0,
                                                            dataSource: dataSet,
                                                            xValueMapper:
                                                                (DataSet orderInfo,
                                                                        _) =>
                                                                    orderInfo
                                                                        .date,
                                                            yValueMapper: (DataSet
                                                                        orderInfo,
                                                                    d) =>
                                                                orderInfo
                                                                    .noOfOrders)
                                                      ])),
                                            ],
                                          )),
                                          if (!Responsive.isMobile(context) ||
                                              Responsive.isMobileLandscape(
                                                  context))
                                            Responsive(
                                              tablet: OrdersTable(
                                                model: model,
                                                headingTextStyle: Constants
                                                    .defaultTextStyle4(),
                                                rowTextStyle: Constants
                                                    .defaultTextStyle1(),
                                              ),
                                              desktop:
                                                  OrdersTable(model: model),
                                              mobile: OrdersTable(model: model),
                                            ),
                                          if (Responsive.isMobile(context))
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: OrdersTable(model: model),
                                            )
                                        ],
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    print('${snapshot.error}');
                                    return const NoDataFound(
                                        'Error occurs, please try again later...');
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        viewModelBuilder: () => OrdersOverTimeViewModel());
  }
}
