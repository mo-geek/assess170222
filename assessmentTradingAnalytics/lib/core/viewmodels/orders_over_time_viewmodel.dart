import 'package:flapkap/app/locator/locator.dart';
import 'package:flapkap/core/models/orders_Info.dart';
import 'package:flapkap/core/models/orders_sum_over_time.dart';
import 'package:flapkap/core/services/orders/order_service.dart';
import 'package:flapkap/core/services/orders_details/orders_details_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../services/drawercontroller/drawercontroller_service.dart';

class OrdersOverTimeViewModel extends BaseViewModel {
  final _ordersService = locator<OrdersService>();
  final _ordersDetailsService = locator<OrdersDetailsService>();

  final _drawerControllerService = locator<DrawerControllerService>();

  GlobalKey<ScaffoldState> get scaffoldKey =>
      _drawerControllerService.scaffoldKey;

  void showDrawer() => _drawerControllerService.showDrawer();

  Future<void> getOrdersList() => _ordersService.getOrdersList();

  OrdersList get ordersList => _ordersService.ordersList;

  List<OrderInfo>? get getSortedOrdersListOverTime =>
      _ordersDetailsService.getSortedOrdersListOverTime();

  int _ordersWithSameDate(DateTime? dateTime) {
    return ordersList.ordersList!
        .where((element) => element.registerDate?.compareTo(dateTime!) == 0)
        .length;
  }

  List<DataSet> generateDataSets() {
    int sum = 0;
    final sortedOrdersList = getSortedOrdersListOverTime!;
    final orderRequestDates =
        {...sortedOrdersList.map((e) => e.registerDate)}.toList();
    final list = List.generate(
        orderRequestDates.length,
        (index) => DataSet(orderRequestDates[index],
            sum += _ordersWithSameDate(orderRequestDates[index])));
    // list.forEach((e) => print('date: ${e.date}, noOrders: ${e.noOfOrders}'));
    return list;
  }

  void initState() async {}
}
