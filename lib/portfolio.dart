import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:cryptowalletappui/provider/marketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  var data = [
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0,
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
  ];
  @override
  Widget build(BuildContext context) {
    final pMarket = Provider.of<PMarket>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child:
                    //Portfolio container
                    Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Portfolio',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Current Balance',
                        style:
                            TextStyle(color: Color(0xFF757575), fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
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
                            style: TextStyle(color: Colors.white, fontSize: 22),
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
                      )
                    ],
                  ),
                ),
              ),

              //Chart Container
              SizedBox(
                height: 10,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Sparkline(
                    lineColor: Colors.green,
                    data: data,
                  )),
              SizedBox(
                height: 5,
              ),
              //Your asset
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Your Assets',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Asset',
                      style: TextStyle(
                        color: Color(0xFF757575),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Color(0xFF757575),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Holdings',
                      style: TextStyle(
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ),
              //list assets
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
                                    Container(
                                      width: 50,
                                      child: Text(
                                        '\$${pMarket.lMarket[index].current_price}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 50,
                                      child: Text(
                                        '\$${pMarket.lMarket[index].current_price}',
                                        style: TextStyle(color: Colors.white),
                                      ),
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
    );
  }
}
