class Product {
  String id;
  String name;
  String email;
  String phone;
  String content;

  Product({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.content,
  });

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        email = snapshot['email'] ?? '',
        phone = snapshot['phone'] ?? '',
        content = snapshot['content'] ?? '';

  toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "content": content,
    };
  }
}
