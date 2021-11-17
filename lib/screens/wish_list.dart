import 'package:flutter/material.dart';
import 'package:grosa_store/widgets/shopping_list.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  bool empty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WishList',
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
                    'You have Not Added in Your WishList',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Shop Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )
          : ShoppingList(),
    );
  }
}
