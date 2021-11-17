import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosa_store/models/coupon.dart';

class CouponList extends StatefulWidget {
  final applicable;
  CouponList({this.applicable});
  @override
  _CouponListState createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  final coupons = [
    CouponModel(
        code: 'LIHLE9706',
        price: 'Minimum Cashback E 50',
        note: 'This coupon expires on June 02, 2021'),
    CouponModel(
        code: 'SLUGA5688',
        price: 'Minimum Cashback E 20',
        note: 'This coupon expires on July 06, 2021'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        coupons[index].code,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    widget.applicable != null
                        ? OutlinedButton(
                            onPressed: () {},
                            child: Text('Apply'),
                          )
                        : Text(
                            'Not applicable',
                            style: TextStyle(color: Colors.red),
                          )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  coupons[index].price,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  coupons[index].note,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
