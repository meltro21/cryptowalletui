import 'dart:convert';

import 'package:cryptowalletappui/main.dart';
import 'package:cryptowalletappui/models/market.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

List<Market> parseMarket(String responseBody) {
  print('start parseBatch');
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print('end patseBatch get');
  return parsed.map<Market>((json) => Market.fromJson(json)).toList();
}

Future<List<Market>> getMarket(http.Client client, String ids) async {
  final response = await client.get(Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
  if (response.statusCode == 200) {
    print(response.body);
  }
  return parseMarket(response.body);
}

class PMarket with ChangeNotifier {
  List<Market> lMarket = [];
  wrapperGetMarket(List<Holdings> holdings) async {
    String ids = holdings.map((e) => e.id).join(',');
    lMarket = await getMarket(http.Client(), ids);
    print('something');
    notifyListeners();
  }
}
