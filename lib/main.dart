import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grosa_store/firebase_options.dart';
import 'package:grosa_store/models/Branch.dart';
import 'package:grosa_store/models/CurrentUser.dart';
import 'package:grosa_store/models/Offer.dart';
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
import 'package:grosa_store/screens/register_screen.dart';
import 'package:grosa_store/screens/shopping.dart';
import 'package:grosa_store/screens/transactions/transactions.dart';
import 'package:grosa_store/screens/wish_list.dart';
import 'package:grosa_store/services/auth_service.dart';
import 'package:grosa_store/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'models/Deal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<CurrentUser?>.value(
          value: AuthService().user,
          initialData: CurrentUser(),
        ),
        StreamProvider<List<Deal>>.value(
          value: DatabaseService().deals,
          initialData: const [],
        ),
        StreamProvider<List<Branch>>.value(
          value: DatabaseService().branches,
          initialData: const [],
        ),
        StreamProvider<List<Offer>>.value(
          value: DatabaseService().offers,
          initialData: const [],
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const AuthStateScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),

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
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
            ),
          ),
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
