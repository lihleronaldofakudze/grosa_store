import 'package:flutter/material.dart';
import 'package:grosa_store/models/shopping_model.dart';

class OffersListWidget extends StatefulWidget {
  const OffersListWidget({Key? key}) : super(key: key);

  @override
  _OffersListWidgetState createState() => _OffersListWidgetState();
}

class _OffersListWidgetState extends State<OffersListWidget> {
  final cart = [
    ShoppingModel(
        id: 1,
        image: 'assets/images/products/one.jpg',
        title: 'Product name',
        description: 'The description of the product.',
        size: 'Product Size',
        price: 23.00,
        quantity: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${cart[index].image}'),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${cart[index].title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${cart[index].description}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('${cart[index].size}'),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'E ${cart[index].price}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: cart[index].quantity == 0
                        ? Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/sixty-percentage.png'))),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    cart[index].quantity++;
                                  });
                                },
                                child: Text('Add'),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cart[index].quantity--;
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text('${cart[index].quantity}'),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cart[index].quantity++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              )
                            ],
                          ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
