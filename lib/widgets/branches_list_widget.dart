import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosa_store/models/Branch.dart';
import 'package:provider/provider.dart';

class BranchesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final branches = Provider.of<List<Branch>>(context);
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
                          image: NetworkImage(branches[index].image),
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
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Contact Info : ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: branches[index].numbers,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  branches[index].hours,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.web)),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: branches.length);
  }
}
