import 'package:flutter/material.dart';
import 'package:grosa_store/widgets/coupon_list.dart';

class Coupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool empty = false;
    final applicable = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coupons',
        ),
        centerTitle: true,
      ),
      body: empty
          ? Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    image: AssetImage('images/grosa.png'),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'You have No Coupons Available',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            )
          : CouponList(
              applicable: applicable,
            ),
    );
  }
}
