import 'package:flutter/material.dart';
import 'package:grosa_store/constants.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:grosa_store/widgets/loading_widget.dart';
import 'package:grosa_store/widgets/ok_alert_widget.dart';
import 'package:grosa_store/widgets/social_login_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Register',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.asset(
                      'images/logo.png',
                      height: 125,
                    ),
                    const Text(
                      'Please enter all details.',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _confirmPasswordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: _register,
                          child: const Text(
                            'Create your account',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Or'),
                    const SizedBox(
                      height: 16,
                    ),
                    SocialLoginWidget(
                      isLoading: _isLoading,
                      type: 'Register',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  _register() async {
    setState(() {
      _isLoading = true;
    });
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      if (_passwordController.text == _confirmPasswordController.text) {
        final result = await AuthService().signUpUsingEmail(
            email: _emailController.text, password: _passwordController.text);

        if (result != null) {
          await DatabaseService(uid: result.uid)
              .updateCustomer(
                  image: Constants().mf2,
                  name: 'Customer Name',
                  number: 'Add number')
              .then((value) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushNamed(context, '/auth');
          });
        } else {
          setState(() {
            _isLoading = false;
          });
          showDialog(
              context: context,
              builder: (_) => okAlertWidget(
                  context: context,
                  message: 'Please enter all required details.'));
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        showDialog(
            context: context,
            builder: (_) => okAlertWidget(
                context: context, message: 'Passwords do not match.'));
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (_) => okAlertWidget(
          context: context,
          message: 'Please enter all required details',
        ),
      );
    }
  }
}
