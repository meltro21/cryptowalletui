class Market {
  late String id,
      symbol,
      name,
      image,
      // ignore: non_constant_identifier_names

      // ignore: non_constant_identifier_names
      price_change_percentage_24h,
      // ignore: non_constant_identifier_names
      holding_value_change_24h,
      current_price;

  Market(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.current_price,
      required this.price_change_percentage_24h,
      required this.holding_value_change_24h});

  factory Market.fromJson(Map<String, dynamic> json) {
    return new Market(
      id: json['id'].toString(),
      symbol: json['symbol'].toString(),
      name: json['name'].toString(),
      image: json['image'].toString(),
      current_price: json['current_price'].toString(),
      price_change_percentage_24h:
          json['price_change_percentage_24h'].toString(),
      holding_value_change_24h: json['holding_value_change_24h'].toString(),
    );
  }
}
