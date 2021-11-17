class ProductCategory {
  bool isExpanded;
  final String categoryName;
  final List<String> subCategories;

  ProductCategory(
      {this.isExpanded: false,
      required this.categoryName,
      required this.subCategories});
}
