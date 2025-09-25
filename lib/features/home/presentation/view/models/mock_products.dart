import 'package:egyptian_supermaekat/features/home/presentation/view/models/product.dart';

final List<Product> mockProducts = [
  Product(
    name: 'فراولة طازجة 1 كجم',
    imageUrl: 'https://assets.stickpng.com/images/580b57fcd9996e24bc43c233.png',
    price: 50.0,
    rating: 4.5,
    isAvailable: true,
    discountPercentage: 10,
  ),
  Product(
    name: 'آيس كريم 3 عبوات',
    imageUrl: 'https://assets.stickpng.com/images/580b57fcd9996e24bc43c1c3.png',
    price: 15.34,
    rating: 4.5,
    isAvailable: false,
  ),
  Product(
    name: 'تفاح أحمر طازج',
    imageUrl: 'https://assets.stickpng.com/images/580b57fcd9996e24bc43c11d.png',
    price: 25.0,
    rating: 4.8,
    isAvailable: true,
    discountPercentage: null,
  ),
];
