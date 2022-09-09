import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SocialLoginWidget extends StatefulWidget {
  bool isLoading;
  final String type;
  SocialLoginWidget({
    super.key,
    required this.isLoading,
    required this.type,
  });

  @override
  State<SocialLoginWidget> createState() => _SocialLoginWidgetState();
}

class _SocialLoginWidgetState extends State<SocialLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Column(
        children: [
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: _facebookLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 18,
                  ),
                  Text('${widget.type} with Facebook'.toUpperCase())
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: _googleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.google,
                    size: 18,
                  ),
                  Text('${widget.type} with Google'.toUpperCase())
                ],
              ),
            ),
          ),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: _facebookLogin,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blue.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 18,
                  ),
                  Text('${widget.type} with Facebook'.toUpperCase())
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: _googleLogin,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.google,
                    size: 18,
                  ),
                  Text('${widget.type} with Google'.toUpperCase())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _facebookLogin() async {
    setState(() {
      widget.isLoading = true;
    });
    await AuthService().signInWithFacebook().then((user) async {
      bool isHere = await DatabaseService(uid: user!.uid).checkCustomer();

      if (isHere) {
        setState(() {
          widget.isLoading = false;
        });
      } else {
        await DatabaseService(uid: user.uid)
            .updateCustomer(
                image: user.photoURL.toString(),
                name: user.displayName.toString(),
                number: 'Add number')
            .then((value) {
          setState(() {
            widget.isLoading = false;
          });
          Navigator.pushNamed(context, '/auth');
        });
      }
    });
  }

  _googleLogin() async {
    setState(() {
      widget.isLoading = true;
    });
    await AuthService().signInWithGoogle().then((user) async {
      bool isHere = await DatabaseService(uid: user!.uid).checkCustomer();

      if (isHere) {
        setState(() {
          widget.isLoading = false;
        });
      } else {
        await DatabaseService(uid: user.uid)
            .updateCustomer(
                image: user.photoURL.toString(),
                name: user.displayName.toString(),
                number: 'Add number')
            .then((value) {
          setState(() {
            widget.isLoading = false;
          });
          Navigator.pushNamed(context, '/auth');
        });
      }
    });
  }
}
