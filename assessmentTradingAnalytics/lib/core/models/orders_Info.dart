import 'package:intl/intl.dart';

class OrdersList {
  List<OrderInfo>? ordersList;

  OrdersList(this.ordersList);

  OrdersList.fromJson(List<dynamic> data) {
    ordersList = List<OrderInfo>.from(data.map((e) => OrderInfo.fromJson(e)));
    // ordersList?.map((e) => print(e.registerDate)).toList();
  }
}

class OrderInfo {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? registered;
  DateTime? registerDate;

  OrderInfo({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
    this.registerDate,
  });

  OrderInfo copyWith(String? registered, DateTime? registerDate) {
    return OrderInfo(
      registered: registered ?? this.registered,
      registerDate: registerDate ?? this.registerDate,
    );
  }

  OrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    registered = json['registered'];
    registerDate = DateFormat("yyyy-MM-dd")
        .parse(json['registered'].toString().substring(0, 10));
    // DateFormat("yyyy-mm-ddThh:mm:ss.s+zzzzzz").parse(json['registered']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['isActive'] = isActive;
    data['price'] = price;
    data['company'] = company;
    data['picture'] = picture;
    data['buyer'] = buyer;
    data['tags'] = tags;
    data['status'] = status;
    data['registered'] = registered;
    return data;
  }
}
