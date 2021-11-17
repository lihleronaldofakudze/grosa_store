import 'package:flutter/material.dart';
import 'package:grosa_store/widgets/offers_list.dart';

class Offer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/special-offers.png'),
                  fit: BoxFit.contain
                )
              ),
            ),
            PhysicalModel(
              color: Colors.white,
              elevation: 8,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'All Offers (1 Items)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 800,
              child: OffersList(),
            )
          ],
        ),
      ),
    );
  }
}
