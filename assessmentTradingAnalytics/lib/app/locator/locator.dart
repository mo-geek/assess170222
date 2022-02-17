import 'package:flapkap/core/services/orders/order_service.dart';
import 'package:flapkap/core/services/orders/orders_service_implementation.dart';
import 'package:flapkap/core/services/orders_details/orders_details_service.dart';
import 'package:flapkap/core/services/orders_details/orders_details_service_implementation.dart';
import 'package:get_it/get_it.dart';

import '../../core/services/drawercontroller/drawercontroller_service.dart';

final locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton<OrdersService>(() => OrderServiceImpl());
  locator
      .registerLazySingleton<OrdersDetailsService>(() => OrdersDetailsImpl());
  locator.registerFactory<DrawerControllerService>(
      () => DrawerControllerService());
}
