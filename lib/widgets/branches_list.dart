import 'package:flutter/material.dart';
import 'package:grosa_store/models/branch.dart';

class BranchesList extends StatelessWidget {
  final branches = [
    Branch(
        image: 'images/icon.png',
        name: 'Kasani General Dealer',
        address: 'Mbabane, Sidvwashini',
        numbers: '+26876123456',
        hours: 'Monday - Saturday 9am - 6pm | Sunday 12pm 6pm'),
    Branch(
        image: 'images/icon.png',
        name: 'Kasani General Dealer',
        address: 'Mbabane, Sidvwashini',
        numbers: '+26876123456',
        hours: 'Monday - Saturday 9am - 6pm | Sunday 12pm 6pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(branches[index].image),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  branches[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  branches[index].address,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  branches[index].numbers,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  branches[index].hours,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: branches.length);
  }
}
