class Coffee {
  // Fields
  final String name;
  final String type;
  final String price;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String description;
  final String category;

  // Constructor
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

  // Convert a Coffee object into a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'description': description,
      'category': category,
    };
  }

  // Convert a Map (JSON) back into a Coffee object
  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      name: json['name'],
      type: json['type'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(), // Safe casting for double/int types
      reviewCount: json['reviewCount'],
      description: json['description'],
      category: json['category'],
    );
  }
}