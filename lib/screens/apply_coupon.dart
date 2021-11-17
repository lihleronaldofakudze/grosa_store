import 'package:flutter/material.dart';
import 'package:grosa_store/widgets/coupon_list.dart';

class ApplyCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Coupon'),
        centerTitle: true,
      ),
      body: CouponList(),
    );
  }
}
