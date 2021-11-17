import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grosa_store/models/Address.dart';
import 'package:grosa_store/models/Customer.dart';
import 'package:grosa_store/models/Deal.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference _customersCollection =
      FirebaseFirestore.instance.collection('customers');
  final CollectionReference _dealsCollection =
      FirebaseFirestore.instance.collection('deals');

  //Check If User Already Exists In Database
  checkCustomer() async {
    DocumentSnapshot documentSnapshot =
        await _customersCollection.doc(uid).get();

    if (documentSnapshot.exists) {
      return false;
    } else {
      return false;
    }
  }

  //Update User Details
  Future updateCustomer(
      {required String image, required String name, required String number}) {
    return _customersCollection
        .doc(uid)
        .set({'image': image, 'name': name, 'number': number});
  }

  //Get Customer Snapshot
  Customer _customerFromSnapshot(DocumentSnapshot snapshot) {
    return Customer(
        image: snapshot.get('image'),
        name: snapshot.get('name'),
        number: snapshot.get('number'));
  }

  //Stream Customer Snapshot
  Stream<Customer> get customer {
    return _customersCollection.doc(uid).snapshots().map(_customerFromSnapshot);
  }

  //Update Customer Address
  Future updateCustomerAddress(
      {required String region,
      required String city,
      required String street,
      required String premises,
      required String nickname}) {
    return _customersCollection.doc(uid).collection('addresses').add({
      'region': region,
      'city': city,
      'street': street,
      'premises': premises,
      'nickname': nickname
    });
  }

  //Get Address List Snapshot
  List<Address> _addressesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Address(
          id: doc.id,
          region: doc.get('region'),
          city: doc.get('city'),
          street: doc.get('street'),
          premises: doc.get('premises'),
          nickname: doc.get('nickname'));
    }).toList();
  }

  //Stream Customer Addresses
  Stream<List<Address>> get addresses {
    return _customersCollection
        .doc(uid)
        .collection('addresses')
        .snapshots()
        .map(_addressesListFromSnapshot);
  }

  List<Deal> _dealsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Deal(
          id: doc.id, image: doc.get('image'), postedAt: doc.get('postedAt'));
    }).toList();
  }

  Stream<List<Deal>> get deals {
    return _dealsCollection.snapshots().map(_dealsFromSnapshot);
  }
}
