import 'package:flapkap/core/models/orders_Info.dart';
import 'package:flapkap/core/viewmodels/orders_over_time_viewmodel.dart';
import 'package:flapkap/ui/shared/responsive/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class OrdersTable extends StatelessWidget {
  final OrdersOverTimeViewModel model;
  final TextStyle? headingTextStyle;
  final TextStyle? rowTextStyle;

  const OrdersTable(
      {Key? key, required this.model, this.headingTextStyle, this.rowTextStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingTextStyle: headingTextStyle ?? Constants.defaultTextStyle2(),
        columnSpacing: Responsive.isMobileLandscape(context) ? 9 : null,
        columns: const [
          DataColumn(label: Text('Product Id')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Company')),
          DataColumn(label: Text('Buyer Name')),
          DataColumn(label: Text('Registration Date')),
        ],
        rows: List.generate(
            model.ordersList.ordersList!.length,
            (index) => ordersTableData(
                model.ordersList.ordersList![index], rowTextStyle)));
  }
}

DataRow ordersTableData(OrderInfo orderInfo, TextStyle? rowTextStyle) {
  return DataRow(cells: [
    DataCell(Text(orderInfo.id!,
        style: rowTextStyle ?? Constants.defaultTextStyle3())),
    DataCell(Text(orderInfo.price!,
        style: rowTextStyle ?? Constants.defaultTextStyle3())),
    DataCell(Text(orderInfo.company!,
        style: rowTextStyle ?? Constants.defaultTextStyle3())),
    DataCell(Text(orderInfo.buyer!,
        style: rowTextStyle ?? Constants.defaultTextStyle3())),
    DataCell(Text(orderInfo.registered!,
        style: rowTextStyle ?? Constants.defaultTextStyle3())),
  ]);
}
