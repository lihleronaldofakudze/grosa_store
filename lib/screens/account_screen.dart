import 'package:flutter/material.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/models/Customer.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:grosa_store/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser?>(context);
    return StreamBuilder<Customer>(
        stream: DatabaseService(uid: currentUser!.uid).customer,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Customer? customer = snapshot.data;

            return Scaffold(
              backgroundColor: Colors.grey,
              appBar: AppBar(
                title: Text('Account'),
                elevation: 0,
              ),
              body: Container(
                child: Column(
                  children: [
                    Card(
                      color: Colors.green,
                      margin: EdgeInsets.all(0.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(customer!.image.toString()),
                        ),
                        title: Text(
                          customer.name.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          customer.number.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/address');
                      },
                      child: Card(
                        margin: EdgeInsets.all(0.0),
                        color: Colors.green,
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            'Add Address',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          trailing: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(color: Colors.white)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/address');
                            },
                            child: Text('Change'),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/orders');
                      },
                      child: Card(
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_bag,
                              color: Colors.green,
                            ),
                          ),
                          title: Text(
                            'My Orders',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/transactions');
                      },
                      child: Card(
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wifi_protected_setup_sharp,
                                color: Colors.green),
                          ),
                          title: Text(
                            'My Transaction',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.ad_units, color: Colors.green),
                        ),
                        title: Text(
                          'My Referral Code',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/coupons');
                      },
                      child: Card(
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.label, color: Colors.green),
                          ),
                          title: Text(
                            'My Reward Coupons',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/address');
                      },
                      child: Card(
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_location_rounded,
                                color: Colors.green),
                          ),
                          title: Text(
                            'My Delivery Address',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Grosa'),
                            content: Text('Are your sure you want to exit?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await AuthService().signOut().then((value) {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/auth');
                                  });
                                },
                                child: Text('Yes'),
                              )
                            ],
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.login, color: Colors.green),
                          ),
                          title: Text(
                            'LogOut',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return LoadingWidget();
          }
        });
  }
}
