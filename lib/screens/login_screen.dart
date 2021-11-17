import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:grosa_store/widgets/loading_widget.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Container(
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LottieBuilder.asset('images/login.json'),
                  Text('Please login start your grosa orders.', style: TextStyle(fontSize: 18),),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await AuthService()
                                .signInWithFacebook()
                                .then((user) async {
                              bool isHere =
                                  await DatabaseService(uid: user!.uid)
                                      .checkCustomer();

                              if (isHere) {
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.pushNamed(context, '/auth');
                              } else {
                                await DatabaseService(uid: user.uid)
                                    .updateCustomer(
                                        image: user.photoURL,
                                        name: user.displayName,
                                        number: 'Add number')
                                    .then((value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pushNamed(context, '/auth');
                                });
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.facebook),
                              Expanded(
                                child: Text(
                                  'Login using Facebook',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await AuthService()
                                .signInWithGoogle()
                                .then((user) async {
                              bool isHere =
                                  await DatabaseService(uid: user!.uid)
                                      .checkCustomer();

                              if (isHere) {
                                setState(() {
                                  _isLoading = false;
                                });
                                Navigator.pushNamed(context, '/auth');
                              } else {
                                await DatabaseService(uid: user.uid)
                                    .updateCustomer(
                                        image: user.photoURL,
                                        name: user.displayName,
                                        number: 'Add number')
                                    .then((value) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pushNamed(context, '/auth');
                                });
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              Expanded(
                                child: Text(
                                  'Login using Gmail',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
