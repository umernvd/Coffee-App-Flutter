import '../models/coffee_model.dart';
import '../models/onboarding_item.dart';

class CoffeeRepository {
  // Singleton Pattern
  static final CoffeeRepository _instance = CoffeeRepository._internal();
  factory CoffeeRepository() => _instance;
  CoffeeRepository._internal();

  // Data Source (Simulating API)
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      image: 'assets/espresso.png',
      title: 'Espresso',
      description: 'Bold, concentrated coffee with rich crema.',
    ),
    OnboardingItem(
      image: 'assets/cappuccino.png',
      title: 'Cappuccino',
      description:
          'Creamy and smooth with equal parts espresso, steamed milk, and foam.',
    ),
    OnboardingItem(
      image: 'assets/latte.png',
      title: 'Latte',
      description: 'Silky and mild with more steamed milk than cappuccino.',
    ),
  ];

  final List<Coffee> _coffees = [
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

    // Espresso
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

    // Latte
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

    // Americano
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

  // Public Getters
  List<OnboardingItem> getOnboardingItems() =>
      List.unmodifiable(_onboardingItems);
  List<Coffee> getCoffees() => List.unmodifiable(_coffees);
}
