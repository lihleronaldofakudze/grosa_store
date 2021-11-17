import 'package:flutter/material.dart';
import 'package:grosa_store/models/product_category.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ProductCategory> _categories = [
    ProductCategory(categoryName: 'Fruits & Vegetables', subCategories: [
      'All Fruits & Vegetables',
      'Fresh Vegetables',
      'Herb & Seasonings',
      'Fresh Fruits',
      'Exotic Fruits & Veggies',
      'Cut & Sprouts',
      'Flower Bouquets, Bunches',
    ]),
    ProductCategory(categoryName: 'Foodgrains, Oil & Masala', subCategories: [
      'All Foodgrains, Oil & Masala',
      'Atta, Flours & Sooji',
      'Dals & Pulses',
      'Salt, Sugar & Jaggry',
      'Edible Oils & Ghee',
    ]),
    ProductCategory(
        categoryName: 'Bakery, Cakes & Diary', subCategories: ['One', 'Two']),
    ProductCategory(categoryName: 'Beverages', subCategories: [
      'All Beverages',
      'Water',
      'Tea',
    ]),
    ProductCategory(
        categoryName: 'Snacks & Branded Foods', subCategories: ['One', 'Two']),
    ProductCategory(
        categoryName: 'Beauty & Hygiene', subCategories: ['One', 'Two']),
    ProductCategory(
        categoryName: 'Cleaning & Household', subCategories: ['One', 'Two']),
    ProductCategory(
        categoryName: 'Kitchen, Garden & Pets', subCategories: ['One', 'Two']),
    ProductCategory(
        categoryName: 'Eggs, Meat & Fish',
        subCategories: ['All Eggs, Meat & Fish']),
    ProductCategory(
        categoryName: 'Eswatini Traditional',
        subCategories: ['Best Eswatini Traditional Food']),
  ];

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _categories[index].isExpanded = !_categories[index].isExpanded;
            });
          },
          children: _categories.map((ProductCategory category) {
            return ExpansionPanel(
                isExpanded: category.isExpanded,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.categoryName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                body: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: category.subCategories.map((sub) {
                      return OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.done_rounded),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              sub,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }
}
