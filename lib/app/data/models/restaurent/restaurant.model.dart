class Restaurant {
  int? id = 0;
  final String name;
  final double minPrice;
  final double rating;
  final String imageUrl;
  final double distance;
  final bool? isPopular;
  final String? description;

  Restaurant({
    this.id = 0,
    this.isPopular = false,
    required this.name,
    required this.minPrice,
    required this.imageUrl,
    required this.rating,
    required this.distance,
    this.description,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      minPrice: json['minPrice'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      distance: json['distance'],
      isPopular: json['isPopular'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'minPrice': minPrice,
        'imageUrl': imageUrl,
        'rating': rating,
        'distance': distance,
        'isPopular': isPopular,
        'description': description,
      };
}
