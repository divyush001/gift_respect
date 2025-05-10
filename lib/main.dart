import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_respect/services/user_service.dart';
import 'package:gift_respect/view/screens/home.dart';
import 'package:gift_respect/view/screens/spot.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;

    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gift Respect'),
          iconTheme: IconThemeData(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            ),
          ],
        ),
        body: Home(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              //selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Badge(child: Icon(Icons.people_alt_sharp)),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
              label: 'Messages',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 255, 0, 0),
          onTap: (i) => Get.to(Spot(users: userService.loadUsers())),
        ),
      ),
    );
  }
}
