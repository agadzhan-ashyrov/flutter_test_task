class Product {
  int? id;
  late String name;
  int? price;
  String? category;
  late String image;

  Product(
      {this.id,
      this.category,
      required this.image,
      required this.name,
      this.price});

  Product.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
  }
}
