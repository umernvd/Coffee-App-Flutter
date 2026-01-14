class Coffee {
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String description;
  final String category; 

  Coffee({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.category, 
  });
}

// 8 Coffees (2 per category)
final List<Coffee> coffeeList = [
  // --- Cappuccino ---
  Coffee(
    name: 'Caffe Mocha',
    type: 'Deep Foam',
    price: '4.53',
    imageUrl: 'assets/cappuccino1.png', 
    rating: 4.8,
    reviewCount: 230,
    description: 'Rich espresso with steamed milk and a deep layer of foam.',
    category: 'Cappuccino',
  ),
  Coffee(
    name: 'Vanilla Cappuccino',
    type: 'Vanilla syrup',
    price: '5.00',
    imageUrl: 'assets/cappuccino2.png',
    rating: 4.7,
    reviewCount: 180,
    description: 'Classic cappuccino with a sweet hint of vanilla.',
    category: 'Cappuccino',
  ),

  // --- Espresso ---
  Coffee(
    name: 'Double Espresso',
    type: 'Strong',
    price: '3.50',
    imageUrl: 'assets/espresso1.png',
    rating: 4.9,
    reviewCount: 300,
    description: 'A double shot of pure, intense coffee.',
    category: 'Espresso',
  ),
  Coffee(
    name: 'Espresso Macchiato',
    type: 'Dash of Milk',
    price: '3.80',
    imageUrl: 'assets/espresso2.png',
    rating: 4.8,
    reviewCount: 150,
    description: 'Espresso "stained" with a small amount of milk.',
    category: 'Espresso',
  ),

  // --- Latte ---
  Coffee(
    name: 'Caramel Latte',
    type: 'Sweet & Creamy',
    price: '4.80',
    imageUrl: 'assets/latte1.png',
    rating: 4.6,
    reviewCount: 210,
    description: 'Steamed milk with espresso and caramel drizzle.',
    category: 'Latte',
  ),
  Coffee(
    name: 'Hazelnut Latte',
    type: 'Nutty flavor',
    price: '4.90',
    imageUrl: 'assets/latte2.png',
    rating: 4.7,
    reviewCount: 190,
    description: 'Warm latte with roasted hazelnut syrup.',
    category: 'Latte',
  ),

  // --- Americano ---
  Coffee(
    name: 'Classic Americano',
    type: 'Black',
    price: '3.00',
    imageUrl: 'assets/americano1.png',
    rating: 4.5,
    reviewCount: 120,
    description: 'Espresso diluted with hot water.',
    category: 'Americano',
  ),
  Coffee(
    name: 'Iced Americano',
    type: 'Cold & Refreshing',
    price: '3.50',
    imageUrl: 'assets/americano2.png',
    rating: 4.6,
    reviewCount: 140,
    description: 'Chilled espresso served over ice.',
    category: 'Americano',
  ),
];