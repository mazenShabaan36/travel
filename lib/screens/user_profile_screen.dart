import 'package:flutter/material.dart';
import 'package:travella/screens/edit_profile_screen.dart';
import 'package:travella/screens/wishlist.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Widget _profile_builder(BuildContext context, String text, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0, bottom: 9.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: icon,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2),
            ),
            /* SizedBox(
              width: 128,
            ),
            */
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade700,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 18.0, right: 10, bottom: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.19,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    colors: [Color(0XFFB4C1C4), Theme.of(context).primaryColor],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/kanoza.jpg', height: 100),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02777,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kenzy Kazak',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.00625,
                        ),
                        Text(
                          'kenzy@yahoo.com',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => edit_profile()));
                },
                child: _profile_builder(
                    context,
                    'Edit Profile',
                    Icon(Icons.edit_outlined,
                        color: Theme.of(context).primaryColor, size: 32)),
              ),
              InkWell(
                onTap: () {},
                child: _profile_builder(
                    context,
                    'Settings',
                    Icon(Icons.settings,
                        color: Theme.of(context).primaryColor, size: 32)),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WishListScreen()));
                },
                child: _profile_builder(
                    context,
                    'My Wishlist',
                    Icon(Icons.favorite_border_outlined,
                        color: Theme.of(context).primaryColor, size: 32)),
              ),
              InkWell(
                onTap: () {},
                child: _profile_builder(
                    context,
                    'Change Language',
                    Icon(Icons.language_outlined,
                        color: Theme.of(context).primaryColor, size: 32)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
