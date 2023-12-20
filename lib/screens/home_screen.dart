import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travella/models/hotel_model.dart';
import 'package:travella/screens/login_signup.dart';
import 'package:travella/screens/user_profile_screen.dart';
import 'package:travella/screens/wishlist.dart';

import 'package:travella/widgets/destination_carousel.dart';
import 'package:travella/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    // ignore: deprecated_member_use
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).cardColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0XFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _currentTab == 1
            ? WishListScreen()
            : _currentTab == 2
                ? const UserProfile()
                : ListView(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 260,
                              child: Text(
                                'What would you like to find?',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthLayout()));
                              },
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                child: Count.isReg
                                    ? CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/kanoza.jpg"),
                                      )
                                    : Icon(
                                        Icons.person,
                                        color: Theme.of(context).primaryColor,
                                      ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _icons
                            .asMap()
                            .entries
                            .map(
                              (MapEntry map) => _buildIcon(map.key),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      DestinationCarousel(),
                      SizedBox(
                        height: 20.0,
                      ),
                      HotelCarousel(),
                    ],
                  ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            // icon:SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.favorite_sharp,
              size: 30,
            ),
            // title:SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Count.isReg
                ? CircleAvatar(
                    radius: 15.0,
                    backgroundImage: AssetImage("assets/images/kanoza.jpg"),
                  )
                : Icon(Icons.person),
            // title:SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
