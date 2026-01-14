class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

// The specific data requested
final List<OnboardingItem> onboardingData = [
  OnboardingItem(
    image: 'assets/espresso.jpg', 
    title: 'Espresso',
    description: 'Bold, concentrated coffee with rich crema.',
  ),
  OnboardingItem(
    image: 'assets/cappuccino.jpg', 
    title: 'Cappuccino',
    description: 'Creamy and smooth with equal parts espresso, steamed milk, and foam.',
  ),
  OnboardingItem(
    image: 'assets/latte.jpg', 
    title: 'Latte',
    description: 'Silky and mild with more steamed milk than cappuccino.',
  ),
];