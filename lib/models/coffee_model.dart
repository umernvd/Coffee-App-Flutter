class Coffee {
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final double rating;

  Coffee({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}

final List<Coffee> coffeeList = [
  Coffee(
    name: 'Caffe Mocha',
    type: 'Deep Foam',
    price: '4.53',
    imageUrl: 'assets/coffee1.png',
    rating: 4.8,
  ),
  Coffee(
    name: 'Flat White',
    type: 'Espresso',
    price: '3.53',
    imageUrl: 'assets/coffee2.png',
    rating: 4.8,
  ),
  Coffee(
    name: 'Mocha Fusi',
    type: 'Ice/Hot',
    price: '7.53',
    imageUrl: 'assets/coffee3.png',
    rating: 4.9,
  ),
  Coffee(
    name: 'Caffe Panna',
    type: 'Ice/Hot',
    price: '5.53',
    imageUrl: 'assets/coffee4.png',
    rating: 4.9,
  ),
];