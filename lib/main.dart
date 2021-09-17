import 'dart:ui';

import 'package:cryptowalletappui/portfolio.dart';
import 'package:cryptowalletappui/profile.dart';
import 'package:cryptowalletappui/provider/marketProvider.dart';
import 'package:cryptowalletappui/provider/tradeProvider.dart';
import 'package:cryptowalletappui/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Holdings {
  late String id;
  late int qty;
  Holdings(this.id, this.qty);
}

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: TradeProvider(),
          ),
          ChangeNotifierProvider.value(
            value: PMarket(),
          )
        ],
        child: MaterialApp(
          title: _title,
          home: MyStatefulWidget(),
        ));
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //constant holdings array
  List<Holdings> holdings = [
    Holdings('bitcoin', 888),
    Holdings('ethereum', 188),
    Holdings('dogecoin', 8888)
  ];

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Portfolio(),
    Text('Index 2: Business'),
    Text(
      'Index 3: Settings',
    ),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pMarket = Provider.of<PMarket>(context, listen: false);
    pMarket.wrapperGetMarket(holdings);
  }

  @override
  Widget build(BuildContext context) {
    final pTrade = Provider.of<TradeProvider>(context);
    final pMarket = Provider.of<PMarket>(context);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color(0xFF1E1E1E)),
        height: pTrade.isTradePressed == false ? 140 : 285,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pTrade.isTradePressed == true
                ? SizedBox(
                    height: 5,
                  )
                : SizedBox(),
            pTrade.isTradePressed == true
                ? AnimatedContainer(
                    duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Transfer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            pTrade.isTradePressed == true
                ? SizedBox(
                    height: 20,
                  )
                : SizedBox(),
            pTrade.isTradePressed == true
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Withdraw',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            pTrade.isTradePressed == true
                ? SizedBox(
                    height: 20,
                  )
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: pTrade.isTradePressed == false
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Color(0xFF3B3B3B),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  color: _selectedIndex == 0
                                      ? Colors.white
                                      : Color(0xFF3B3B3B)),
                            )
                          ],
                        )
                      : SizedBox(),
                ),
                pTrade.isTradePressed == false
                    ? GestureDetector(
                        onTap: () {
                          _onItemTapped(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_box,
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Color(0xFF3B3B3B),
                            ),
                            Text(
                              'Portfolio',
                              style: TextStyle(
                                  color: _selectedIndex == 1
                                      ? Colors.white
                                      : Color(0xFF3B3B3B)),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                GestureDetector(
                  onTap: () {
                    pTrade.tradePressed();
                    _onItemTapped(_selectedIndex);
                    pMarket.wrapperGetMarket(holdings);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            pTrade.isTradePressed == false
                                ? Icons.download
                                : Icons.close,
                            color: Colors.white),
                        Text(
                          'Trade',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                pTrade.isTradePressed == false
                    ? GestureDetector(
                        onTap: () {
                          _onItemTapped(3);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bar_chart,
                              color: _selectedIndex == 3
                                  ? Colors.white
                                  : Color(0xFF3B3B3B),
                            ),
                            Text(
                              'Market',
                              style: TextStyle(
                                  color: _selectedIndex == 3
                                      ? Colors.white
                                      : Color(0xFF3B3B3B)),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                pTrade.isTradePressed == false
                    ? GestureDetector(
                        onTap: () {
                          _onItemTapped(4);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: _selectedIndex == 4
                                  ? Colors.white
                                  : Color(0xFF3B3B3B),
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  color: _selectedIndex == 4
                                      ? Colors.white
                                      : Color(0xFF3B3B3B)),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class customOptions extends StatelessWidget {
  const customOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(bottom: 150),
            height: 100,
            width: 100,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
