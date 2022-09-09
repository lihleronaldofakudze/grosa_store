import 'package:flutter/material.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/models/Customer.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:grosa_store/widgets/drawer_widget.dart';
import 'package:grosa_store/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import 'branches_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import 'notifications.dart';
import 'offers_screen.dart';

class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int _currentIndex = 0;
  final tabs = [
    HomeScreen(),
    Categories(),
    BranchesScreen(),
    OfferScreen(),
    Notifications()
  ];

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser?>(context);
    return StreamBuilder<Customer>(
        stream: DatabaseService(uid: currentUser!.uid).customer,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Customer? customer = snapshot.data;
            return Scaffold(
              drawer: drawerWidget(
                  context: context,
                  image: customer!.image ?? '',
                  name: customer.name ?? ''),
              appBar: AppBar(
                backgroundColor: Colors.green,
                elevation: 0,
                title: Text('Grosa'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/shopping');
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/account');
                    },
                    icon: Icon(
                      Icons.person_outline,
                    ),
                  )
                ],
              ),
              body: tabs[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.green,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apps_outlined), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apartment_outlined), label: 'Branches'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.whatshot_outlined), label: 'Offer'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_none_outlined),
                      label: 'Messages'),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            );
          } else {
            return LoadingWidget();
          }
        });
  }
}
