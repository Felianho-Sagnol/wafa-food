class ProductCategory {
  int? id = 0;
  final String title;
  final String imageurl;

  ProductCategory({
    this.id = 0,
    required this.title,
    required this.imageurl,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      title: json['title'],
      imageurl: json['imageurl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageurl': imageurl,
      };
}
