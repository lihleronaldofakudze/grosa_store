import 'package:flutter/material.dart';
import 'package:grosa_store/models/Address.dart';
import 'package:provider/provider.dart';

class AddressListWidget extends StatefulWidget {
  const AddressListWidget({Key? key}) : super(key: key);

  @override
  _AddressListWidgetState createState() => _AddressListWidgetState();
}

class _AddressListWidgetState extends State<AddressListWidget> {
  int _selectedAddress = 1;
  setSelectedAddress(value) {
    setState(() {
      _selectedAddress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final addresses = Provider.of<List<Address>>(context);
    return addresses.length == 0
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
                  'You have Not Add Any Address.',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_address',
                          arguments: {'action': 'Add', 'id': null});
                    },
                    child: Text(
                      'Add New Address',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        : Column(
            children: [
              ListTile(
                title: Text(
                  'SAVED ADDRESS',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_address',
                        arguments: {'action': 'Add', 'id': null});
                  },
                  child: Text('ADD ADDRESS'),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(children: [
                          RadioListTile(
                            onChanged: (value) {
                              setSelectedAddress(value);
                            },
                            groupValue: _selectedAddress,
                            value: index,
                            secondary: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/edit_address',
                                      arguments: {
                                        'action': 'Add',
                                        'id': addresses[index].id
                                      });
                                },
                                icon: Icon(Icons.edit_rounded)),
                            title: Text(
                              'Type : ${addresses[index].nickname}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 2),
                            child: Text(
                              'Region : ${addresses[index].region}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 2),
                            child: Text(
                              'City : ${addresses[index].city}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 2),
                            child: Text(
                              'Street : ${addresses[index].street}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 2),
                            child: Text(
                              'Premises : ${addresses[index].premises}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      );
                    },
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: addresses.length),
              ),
            ],
          );
  }
}
