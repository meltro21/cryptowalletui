import 'package:flutter/cupertino.dart';

class TradeProvider with ChangeNotifier {
  bool isTradePressed = false;

  void tradePressed() {
    isTradePressed = !isTradePressed;
    notifyListeners();
  }
}
