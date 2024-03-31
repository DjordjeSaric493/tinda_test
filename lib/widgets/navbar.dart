import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tinda_test/screens/home_scr.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style8, // Choose the style of your NavBar
    );
  }

  List<Widget> _buildScreens() {
    // Define your screens here
    return [
      HomeScreen(), // Replace Placeholder() with your actual screens
      Placeholder(),
      Placeholder(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/iconz/tinder_fire.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/iconz/chat.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/iconz/user_profile.png'),
      ),
    ];
  }
}
