class Product {
  final String name;
  final double rating; 
  final String imageUrl;
  final double price;
  final bool isAvailable;
  final int? discountPercentage; 

  Product({
    required this.name,
    required this.rating, 
    required this.imageUrl,
    required this.price,
    required this.isAvailable,
    this.discountPercentage, 
  });
}