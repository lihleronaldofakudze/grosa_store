import 'package:flutter/material.dart';
import 'package:grosa_store/widgets/drawer_widget.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context),
      appBar: AppBar(
        title: Text(
          'Your Basket',
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
                    image: AssetImage('assets/images/cart.png'),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Your Cart is Empty...',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/delivery_address');
                    },
                    child: Text('Shop Now'),
                  )
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                PhysicalModel(
                  elevation: 23,
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total: E 0',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/delivery_address');
                          },
                          label: Text('Check Out'),
                          icon: Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
