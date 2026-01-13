class Coffee {
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final double rating;
  final int reviewCount; 
  final String description;

  Coffee({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
  });
}

final List<Coffee> coffeeList = [
  Coffee(
    name: 'Caffe Mocha',
    type: 'Ice/Hot',
    price: '4.53',
    imageUrl: 'assets/coffee1.png',
    rating: 4.8,
    reviewCount: 230,
    description: 'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
  ),
  Coffee(
    name: 'Flat White',
    type: 'Espresso',
    price: '3.53',
    imageUrl: 'assets/coffee2.png',
    rating: 4.8,
    reviewCount: 120,
    description: 'Flat white is a coffee drink consisting of espresso with microfoam. It is similar to a latte, but smaller in volume..',
  ),
  Coffee(
    name: 'Mocha Fusi',
    type: 'Ice/Hot',
    price: '7.53',
    imageUrl: 'assets/coffee3.png',
    rating: 4.9,
    reviewCount: 160,
    description: 'Mocha Fusi is a coffee drink consisting of mocha with microfoam. It is similar to a espresso, but larger in volume..',
  ),
  Coffee(
    name: 'Caffe Panna',
    type: 'Ice/Hot',
    price: '5.53',
    imageUrl: 'assets/coffee4.png',
    rating: 4.9,
    reviewCount: 110,
    description: 'Caffe Pana is a coffee drink consisting of pana with microfoam. It is similar to a latte, but smaller in volume..',
  ),
];