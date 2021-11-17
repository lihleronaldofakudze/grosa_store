import 'package:flutter/material.dart';
import 'package:grosa_store/screens/transactions/payment.dart';
import 'package:grosa_store/screens/transactions/wallet.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transactions',
          ),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.only(bottom: 20),
            tabs: [
              Tab(
                text: 'Payment',
              ),
              Tab(
                text: 'Wallet',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Payment(), Wallet()],
        ),
      ),
    );
  }
}
