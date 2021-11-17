import 'package:flutter/material.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:grosa_store/widgets/loading_widget.dart';
import 'package:grosa_store/widgets/ok_alert_widget.dart';
import 'package:provider/provider.dart';

class EditAddressScreen extends StatefulWidget {
  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final _regionController = TextEditingController();
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _premisesController = TextEditingController();
  String _nickname = 'Home';
  int _selectedNickname = 1;
  bool _isLoading = false;

  setSelectedNickname(value) {
    setState(() {
      _selectedNickname = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topic = ModalRoute.of(context)!.settings.arguments;
    final currentUser = Provider.of<CurrentUser?>(context);

    return _isLoading
        ? LoadingWidget()
        : Scaffold(
            appBar: AppBar(
              title: Text('$topic Address'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Region'),
                            controller: _regionController,
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'City'),
                            controller: _cityController,
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Street Name'),
                            controller: _streetController,
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Premises Name'),
                            controller: _premisesController,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Choose a nick name',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Radio(
                          groupValue: _selectedNickname,
                          value: 1,
                          onChanged: (value) {
                            setSelectedNickname(value);
                            setState(() {
                              _nickname = 'Home';
                            });
                          },
                        ),
                        Text(
                          'Home',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Radio(
                          groupValue: _selectedNickname,
                          value: 2,
                          onChanged: (value) {
                            setSelectedNickname(value);
                            setState(() {
                              _nickname = 'Work';
                            });
                          },
                        ),
                        Text(
                          'Work',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Radio(
                          groupValue: _selectedNickname,
                          value: 3,
                          onChanged: (value) {
                            setSelectedNickname(value);
                            setState(() {
                              _nickname = 'Other';
                            });
                          },
                        ),
                        Text(
                          'Other',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          if (_nickname.isNotEmpty &&
                              _regionController.text.isNotEmpty &&
                              _cityController.text.isNotEmpty &&
                              _streetController.text.isNotEmpty &&
                              _premisesController.text.isNotEmpty) {
                            await DatabaseService(uid: currentUser!.uid)
                                .updateCustomerAddress(
                                    region: _regionController.text,
                                    city: _cityController.text,
                                    street: _streetController.text,
                                    premises: _premisesController.text,
                                    nickname: _nickname)
                                .then((value) {
                              setState(() {
                                _isLoading = false;
                              });
                              _regionController.clear();
                              _cityController.clear();
                              _streetController.clear();
                              _premisesController.clear();
                              Navigator.pop(context);
                            }).catchError((onError) {
                              setState(() {
                                _isLoading = false;
                              });
                              _regionController.clear();
                              _cityController.clear();
                              _streetController.clear();
                              _premisesController.clear();
                              showDialog(
                                  context: context,
                                  builder: (_) => okAlertWidget(
                                      context: context,
                                      message: onError.message.toString()));
                            });
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                            showDialog(
                                context: context,
                                builder: (_) => okAlertWidget(
                                    context: context,
                                    message:
                                        'Please enter all required details'));
                          }
                        },
                        child: Text(
                          'Save Address',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
