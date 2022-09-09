import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grosa_store/models/Deal.dart';
import 'package:grosa_store/widgets/main_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deals = Provider.of<List<Deal>>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.green,
            child: TextField(
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 20),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for products',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(height: 200, autoPlay: true),
            items: deals.map((deal) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(deal.image))),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Shop By Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: [
              mainContainer('images/home/Fruits-and-Vegetables.jpg',
                  'Fruits & Vegetables'),
              mainContainer(
                  'images/home/Foodgrains-Oil-Masala-e1581935706583.png',
                  'Foodgrains, Oil & Masala')
            ],
          ),
          Row(
            children: [
              mainContainer('images/home/bakery, cakes & diary.png',
                  'Bakery, Cakes & Diary'),
              mainContainer('images/home/beverages.png', 'Beverages')
            ],
          ),
          Row(
            children: [
              mainContainer('images/home/snacks & branded foods.jpg',
                  'Snacks & Branded Foods'),
              mainContainer(
                  'images/home/beauty & hygiene.png', 'Beauty & Hygiene')
            ],
          ),
          Row(
            children: [
              mainContainer('images/home/cleaning & household.jpg',
                  'Cleaning & Household'),
              mainContainer('images/home/kitchen.jpg', 'Kitchen')
            ],
          ),
          Row(
            children: [
              mainContainer(
                  'images/home/eggs, meat & fish.png', 'Eggs, Meat & Fish'),
              mainContainer('images/home/eswatini traditional.png',
                  'Eswatini Traditional Food')
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Fruits & Vegetables',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: [
              mainContainer(
                  'images/home/fresh vegetables.png', 'Fresh Vegetables'),
              mainContainer(
                  'images/home/herbs & seasonings.png', 'Herbs & Seasonings')
            ],
          ),
          Row(
            children: [
              mainContainer('images/home/fresh fruits.png', 'Fresh Fruits'),
              mainContainer('images/home/exotic fruits & viggies.jpg',
                  'Exotic Fruits & Veggies')
            ],
          ),
          Row(
            children: [
              mainContainer('images/home/cuts & sprouts.jpg', 'Cuts & Sprouts'),
              mainContainer(
                  'images/home/flower bouquets.png', 'Flower Bouquets, Bunches')
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Foodgrains, Oil & Masala',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: [
              mainContainer('images/home/atta, flours & sooji.png',
                  'Atta, Flours & Sooji'),
              mainContainer('images/home/dals & pulses.png', 'Dals & Pulses')
            ],
          ),
          Row(
            children: [
              mainContainer('images/home/salt, sugar & jaggry.png',
                  'Salt, Sugar & Jaggry'),
              mainContainer('images/home/edible oils.png', 'Edible Oils')
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Drinks & Beverages Corner',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: [
              mainContainer('images/home/water.png', 'Water'),
              mainContainer('images/home/tea.png', 'Tea')
            ],
          ),
        ],
      ),
    );
  }
}
