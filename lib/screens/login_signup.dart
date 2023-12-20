
import 'package:flutter/material.dart';
import 'package:travella/screens/login.dart';
import 'package:travella/screens/signup.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key});

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout>
    with SingleTickerProviderStateMixin {
  String selectedCategory = 'Login';
  String currentTab = 'Sign Up';
  late TabController _tabController;

  Widget tabs() {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 0.5,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        // give the indicator a decoration (color and border radius)
        indicator:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).primaryColor,
        ),
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        labelColor: const Color(0xFFFFFFFF),
        unselectedLabelColor: Colors.black,
        tabs: const [
          // first tab [you can add an icon using the icon property]
          Padding(
            padding: EdgeInsets.symmetric(horizontal:30),
            child: Tab(
              text: 'Login',
            ),
          ),

          // second tab [you can add an icon using the icon property]
          Padding(
             padding: EdgeInsets.symmetric(horizontal:28),
            child: Tab(
              text: 'Sign up',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 20.0,
          ),
          child: Column(
            children: [
              tabs(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    Login(),
                    SignUp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
