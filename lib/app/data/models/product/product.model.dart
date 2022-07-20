class Product {
  int? id = 0;
  final String name;
  final double price;
  final String url;
  final bool? isPopular;
  final String? description;
  final double? rating;

  Product({
    this.id = 0,
    required this.name,
    required this.price,
    required this.url,
    this.rating = 1,
    this.isPopular = false,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      url: json['url'],
      isPopular: json['isPopular'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'url': url,
        'rating': rating,
        'isPopular': isPopular,
        'description': description,
      };
}
