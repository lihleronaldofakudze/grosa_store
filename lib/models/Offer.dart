import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  final String id;
  final String image;
  final Timestamp postedAt;

  Offer({required this.id, required this.image, required this.postedAt});
}
