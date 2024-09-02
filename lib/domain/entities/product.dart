class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
      };
}
