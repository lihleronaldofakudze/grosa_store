import 'package:flutter/material.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/widgets/loading_widget.dart';
import 'package:grosa_store/widgets/ok_alert_widget.dart';
import 'package:grosa_store/widgets/social_login_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              width: getValueForScreenType(
                context: context,
                mobile: MediaQuery.of(context).size.width,
                desktop: MediaQuery.of(context).size.width / 2,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        labelText: 'Your Email Address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Your Password',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: () {},
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text(
                        'Click to Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Or'),
                    const SizedBox(
                      height: 16,
                    ),
                    SocialLoginWidget(
                      isLoading: _isLoading,
                      type: 'Login',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/register'),
                            child: const Text(
                              'Click to Register',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
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

  _login() async {
    setState(() {
      _isLoading = true;
    });
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      final result = await AuthService().signInUsingEmail(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (result != null) {
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (_) => okAlertWidget(
            context: context,
            message: 'Please enter all required details.',
          ),
        );
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
