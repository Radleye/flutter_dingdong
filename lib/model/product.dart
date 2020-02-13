class Product {
  String id;
  String name;
  String price;
  String img;
  String description;
  bool isLike;

  Product(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.description,
      this.isLike = false});

  void toggleDone() {
    isLike = !isLike;
  }

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        price = snapshot['price'] ?? '',
        img = snapshot['img'] ?? '',
        isLike = snapshot['isLike'] ?? false,
        description = snapshot['description'] ?? '';

  toJson() {
    return {
      "name": name,
      "price": price,
      "img": img,
      "description": description,
      "isLike": isLike,
    };
  }
}
