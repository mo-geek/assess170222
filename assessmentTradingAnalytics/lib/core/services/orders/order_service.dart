import 'package:flapkap/core/enums/order_status.dart';
import 'package:flapkap/core/models/orders_Info.dart';

abstract class OrdersService {
  OrdersList get ordersList;

  Future<void> getOrdersList();

  String orderStatus(OrderStatus orderStatus);
}
