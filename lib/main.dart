import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/screens/account_screen.dart';
import 'package:grosa_store/screens/address/addresses_screen.dart';
import 'package:grosa_store/screens/address/delivery_address.dart';
import 'package:grosa_store/screens/address/delivery_payment.dart';
import 'package:grosa_store/screens/address/edit_address_screen.dart';
import 'package:grosa_store/screens/apply_coupon.dart';
import 'package:grosa_store/screens/auth_state_screen.dart';
import 'package:grosa_store/screens/coupons.dart';
import 'package:grosa_store/screens/customer_screen.dart';
import 'package:grosa_store/screens/login_screen.dart';
import 'package:grosa_store/screens/orders/orders.dart';
import 'package:grosa_store/screens/shopping.dart';
import 'package:grosa_store/screens/transactions/transactions.dart';
import 'package:grosa_store/screens/wish_list.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:provider/provider.dart';

import 'models/Deal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<CurrentUser?>.value(
            value: AuthService().user,
            initialData: CurrentUser(uid: '', photoURL: '', displayName: '')),
        StreamProvider<List<Deal>>.value(
          value: DatabaseService().deals,
          initialData: [],
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => AnimatedSplashScreen(
                splashIconSize: 240,
                duration: 3000,
                nextScreen: AuthStateScreen(),
                splash: Container(
                  height: 240,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/icon.png'),
                          fit: BoxFit.contain)),
                ),
                splashTransition: SplashTransition.slideTransition,
              ),
          '/auth': (context) => AuthStateScreen(),
          '/login': (context) => LoginScreen(),

          //Customer
          '/customers': (context) => CustomerScreen(),
          '/account': (context) => AccountScreen(),
          '/address': (context) => AddressesScreen(),
          '/coupons': (context) => Coupons(),
          '/shopping': (context) => Shopping(),
          '/orders': (context) => Orders(),
          '/transactions': (context) => Transactions(),
          '/wish_list': (context) => WishList(),
          '/edit_address': (context) => EditAddressScreen(),
          '/delivery_address': (context) => DeliveryAddress(),
          '/delivery_payment': (context) => DeliveryPayment(),
          '/apply_coupon': (context) => ApplyCoupon(),
        },
        title: 'Grosa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme:
                GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)),
      ),
    );
  }
}
