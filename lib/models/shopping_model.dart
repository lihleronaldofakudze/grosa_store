class ShoppingModel {
  final int id;
  final String image;
  final String description;
  final String title;
  final String size;
  final double price;
  int quantity;

  ShoppingModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.size,
      required this.price,
      required this.quantity});
}
