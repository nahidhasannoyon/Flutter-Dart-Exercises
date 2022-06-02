class Product {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isFavorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.isFavorite = false,
    this.price,
  });
}