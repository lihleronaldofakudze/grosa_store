import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/models/Customer.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

Drawer drawerWidget(BuildContext context) {
  final currentUser = Provider.of<CurrentUser?>(context);
  return Drawer(
    child: StreamBuilder<Customer>(
        stream: DatabaseService(uid: currentUser!.uid).customer,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Customer? customer = snapshot.data;
            return Column(
              children: [
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  child: DrawerHeader(
                      child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(customer!.image),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sawubona, ${customer.name}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_location_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/auth');
                  },
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/auth');
                    },
                    icon: Icon(Icons.home, color: Colors.green),
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/account');
                  },
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/account');
                    },
                    icon: Icon(Icons.person, color: Colors.green),
                  ),
                  title: Text(
                    'My Account',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/wish_list');
                  },
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.green),
                    ),
                    title: Text(
                      'My WishList',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/coupons');
                  },
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.label, color: Colors.green),
                    ),
                    title: Text(
                      'Reward Coupons',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/orders');
                  },
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.green,
                      ),
                    ),
                    title: Text(
                      'Order History',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/transactions');
                  },
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
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.info, color: Colors.green),
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.contact_mail, color: Colors.green),
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.lineScale,
                  backgroundColor: Colors.white,
                  colors: [
                    Colors.green,
                    Colors.red,
                    Colors.orange,
                    Colors.yellow
                  ],
                ),
              ),
            );
          }
        }),
  );
}
