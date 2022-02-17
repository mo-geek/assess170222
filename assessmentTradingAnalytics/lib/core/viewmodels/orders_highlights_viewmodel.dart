import 'package:flapkap/app/locator/locator.dart';
import 'package:flapkap/core/services/orders/order_service.dart';
import 'package:flapkap/core/services/orders_details/orders_details_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../services/drawercontroller/drawercontroller_service.dart';

class OrdersHighlightsViewModel extends BaseViewModel {
  final _ordersService = locator<OrdersService>();
  final _ordersDetailsService = locator<OrdersDetailsService>();
  final _drawerControllerService = locator<DrawerControllerService>();

  GlobalKey<ScaffoldState> get scaffoldKey =>
      _drawerControllerService.scaffoldKey;

  void showDrawer() => _drawerControllerService.showDrawer();

  Future<void> getOrdersList() => _ordersService.getOrdersList();

  int get ordersTotalCount => _ordersDetailsService.getOrdersTotalCount();

  double get ordersAveragePrice =>
      _ordersDetailsService.getOrdersAveragePrice();

  double get returnedOrdersNum => _ordersDetailsService.getReturnedOrdersNum();
}
