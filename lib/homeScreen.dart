import 'dart:ui';
import 'dart:math';
import 'package:cryptowalletappui/provider/marketProvider.dart';
import 'package:cryptowalletappui/provider/tradeProvider.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<double> getYAxisData(List<double> data) {
    double max = data.reduce((curr, next) => curr > next ? curr : next);
    double min = data.reduce((curr, next) => curr < next ? curr : next);
    double mid = min + max / 2;
    double higherMid = max + mid / 2;
    double lowerMid = mid + min / 2;
    List<double> temp = [];
    temp.add(max);
    temp.add(higherMid);
    temp.add(mid);
    temp.add(lowerMid);
    temp.add(min);
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF1E1E1E)));
    final pMarket = Provider.of<PMarket>(context);
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    List<double> yAxisData = getYAxisData(data);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  //Outer Transparent Container
                  Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height * 0.15 + 22,
                  ),

                  //Inner black Container
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Wallet',
                          style:
                              TextStyle(color: Color(0xFF757575), fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Color(0xFF757575), fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '45,000',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            Text(
                              'USD',
                              style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Transform.rotate(
                              angle: -180,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '2.30%',
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '7d change',
                              style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 12), //light grey3
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  //buttons of Transfer and Withdraw
                  Positioned(
                    width: MediaQuery.of(context)
                        .size
                        .width, //need to look into this, if width not specified it gives an error as child is a row
                    top: MediaQuery.of(context).size.height * 0.15 - 22,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            height: 45,
                            margin: EdgeInsets.only(left: 30),
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
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            height: 45,
                            margin: EdgeInsets.only(right: 30),
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
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),

                //Chart Container
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Sparkline(
                          useCubicSmoothing: true,
                          cubicSmoothingFactor: 0.2,
                          lineColor: Colors.green,
                          data: data,
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: yAxisData
                            .map((e) => Text(
                                  e.toString(),
                                  style: TextStyle(color: Color(0xFF757575)),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 5,
                ),

                //Top Crypto Currency
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Top Cryptocurrency',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),

                //List of crypto Currency
                pMarket.lMarket.isNotEmpty == true
                    ? Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        height: MediaQuery.of(context).size.height * 0.32,
                        child: ListView.builder(
                            itemCount: pMarket.lMarket.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Image(
                                          height: 15,
                                          width: 15,
                                          image: NetworkImage(
                                              pMarket.lMarket[index].image)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        pMarket.lMarket[index].name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Text(
                                        '\$${pMarket.lMarket[index].current_price}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
