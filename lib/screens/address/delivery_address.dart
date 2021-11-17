import 'package:flutter/material.dart';

class DeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delivery Address'
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                          Icons.location_on
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Deliver to: Other'
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Change'
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The whole address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PhysicalModel(
            color: Colors.white54,
            elevation: 9,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                          'Default Delivery Option'
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '1 Shipment'
                          ),
                          Text(
                              'Delivery Charges: E 50'
                          )
                        ],
                      )
                    ]
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Item',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Quantity',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'price',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ]
                  ),
                  Divider(),
                  Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Mineral Water',
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '10',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Mineral Water',
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '4',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '510',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Delivery Charge: E 50'
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/delivery_payment');
                      },
                      child: Text(
                        'PROCESS TO PAY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
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
