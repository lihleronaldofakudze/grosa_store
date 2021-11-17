import 'package:flutter/material.dart';
import 'package:grosa_store/models/Address.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:grosa_store/widgets/addresses_list_widget.dart';
import 'package:provider/provider.dart';

class AddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUser?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Address',
        ),
        centerTitle: true,
      ),
      body: StreamProvider<List<Address>>.value(
        value: DatabaseService(uid: currentUser!.uid).addresses,
        initialData: [],
        child: AddressListWidget(),
      ),
    );
  }
}
