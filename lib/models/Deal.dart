import 'package:cloud_firestore/cloud_firestore.dart';

class Deal {
  final String id;
  final String image;
  final Timestamp postedAt;

  Deal({required this.id, required this.image, required this.postedAt});
}
