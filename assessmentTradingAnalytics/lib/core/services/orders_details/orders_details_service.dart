import 'package:flapkap/core/models/orders_Info.dart';

abstract class OrdersDetailsService {
  int getOrdersTotalCount();

  double getOrdersAveragePrice();

  double getReturnedOrdersNum();

  List<OrderInfo>? getSortedOrdersListOverTime();
}
