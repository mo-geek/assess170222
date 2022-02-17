import 'package:flapkap/app/locator/locator.dart';
import 'package:flapkap/core/enums/order_status.dart';
import 'package:flapkap/core/models/orders_Info.dart';
import 'package:flapkap/core/services/orders/order_service.dart';

import 'orders_details_service.dart';

class OrdersDetailsImpl implements OrdersDetailsService {
  final ordersService = locator<OrdersService>();

  // numeric metrics about the orders:
  // total count, average price and number of returns

  @override
  int getOrdersTotalCount() {
    final orders = ordersService.ordersList;
    return orders.ordersList?.length ?? 0;
  }

  @override
  double getOrdersAveragePrice() {
    final orders = ordersService.ordersList;
    double? totalPrices = orders.ordersList
        ?.map((e) =>
            double.parse(e.price!.replaceAll(',', '').replaceAll("\$", '')))
        .toList()
        .reduce((value, element) => value + element);
    double result = totalPrices ?? 0 / (orders.ordersList?.length ?? 1) * 1.0;
    return result;
  }

  @override
  double getReturnedOrdersNum() {
    final orders = ordersService.ordersList;
    var totalReturns = orders.ordersList?.where((element) =>
        element.status == ordersService.orderStatus(OrderStatus.returned));
    return (totalReturns?.length ?? 0.0 * 100) /
        (orders.ordersList?.length ?? 1.0);
  }

  @override
  List<OrderInfo>? getSortedOrdersListOverTime() {
    // sort the orders list over time
    final ordersList = ordersService.ordersList.ordersList;
    ordersList?.sort((a, b) {
      return a.registerDate!.compareTo(b.registerDate!);
    });
    return ordersList;
  }
}
