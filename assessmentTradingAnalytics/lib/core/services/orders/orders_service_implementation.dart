import 'dart:convert';

import 'package:flapkap/core/enums/order_status.dart';
import 'package:flapkap/core/models/orders_Info.dart';
import 'package:flapkap/core/services/orders/order_service.dart';
import 'package:flutter/services.dart';

class OrderServiceImpl implements OrdersService {
  late OrdersList _ordersList;

  @override
  OrdersList get ordersList => _ordersList;

  @override
  Future<void> getOrdersList() async {
    // fetch data from json file
    // function with side effects
    try {
      final String response =
          await rootBundle.loadString('assets/jsondata/data.json');
      final data = await json.decode(response);
      final OrdersList ordersInfo = OrdersList.fromJson(data);
      print('fetched data: $ordersInfo');
      print(ordersInfo.ordersList?.length);
      _ordersList = ordersInfo;
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  String orderStatus(OrderStatus orderStatus) {
    String statusText = 'NONE';
    switch (orderStatus) {
      case OrderStatus.ordered:
        statusText = 'ORDERED';
        break;
      case OrderStatus.returned:
        statusText = 'RETURNED';
        break;
      case OrderStatus.delivered:
        statusText = 'DELIVERED';
        break;
    }
    return statusText;
  }
}
