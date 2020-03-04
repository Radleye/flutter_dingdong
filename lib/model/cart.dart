class Cart {
  String id;
  String name;
  String price;
  String img;
  int count;
  bool isLike;

  Cart({this.id, this.name, this.price, this.img, this.count, this.isLike});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    count = json['count'];
    isLike = json['isLike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['count'] = this.count;
    data['isLike'] = this.isLike;
    return data;
  }
}
