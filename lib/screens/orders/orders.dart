import 'package:flutter/material.dart';

import 'cancelled_orders.dart';
import 'completed_orders.dart';
import 'current_orders.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.only(bottom: 20),
            tabs: [
              Tab(text: 'Current'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [CurrentOrders(), CompletedOrders(), CancelledOrders()],
        ),
      ),
    );
  }
}
