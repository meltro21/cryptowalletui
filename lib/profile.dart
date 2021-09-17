import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String dummyEmail = 'Liamjames212121@gmail.com';
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          //to place everything inside Colum with margin wrap it with container and specify constraints
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Profile
              Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),

              //Note: if you want to place a scroll view inside column than you
              // need to wrap that scroll view with Expanded widget
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Email and User Id Row
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              dummyEmail,
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Verified',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),

                        Text(
                          'ID:858888',
                          style: TextStyle(color: Color(0xFF757575)),
                        ),

                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'App',
                          style: TextStyle(color: Color(0xFF757575)),
                        ),

                        //Launch Screen Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Launch Screen',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  color: Color(0xFF757575), fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        //Appearence Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Appearence',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              'Dark',
                              style: TextStyle(
                                  color: Color(0xFF757575), fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        //Account Row
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(color: Color(0xFF757575)),
                        ),

                        //Payment Currency Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Payment Currency',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              'USD',
                              style: TextStyle(
                                  color: Color(0xFF757575), fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        //Language Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Language',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              'English',
                              style: TextStyle(
                                  color: Color(0xFF757575), fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        //Security Row
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Security',
                          style: TextStyle(color: Color(0xFF757575)),
                        ),
                        //FaceId row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'FaceId',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.white,
                            )
                          ],
                        ),

                        //Password Settings Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Password Settings',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        //Change Password Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Change Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        //2-Factor Password Row
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              '2-Factor Authentication',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
