import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grosa_store/models/Offer.dart';
import 'package:grosa_store/widgets/offers_list.dart';
import 'package:provider/provider.dart';

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final offers = Provider.of<List<Offer>>(context);
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200, autoPlay: true),
              items: offers.map((offer) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(offer.image))),
                );
              }).toList(),
            ),
            PhysicalModel(
              color: Colors.white,
              elevation: 8,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'All Offers (${offers.length} Items)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 800,
              child: OffersListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
