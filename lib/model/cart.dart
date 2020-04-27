class Cart {
  String id;
  String name;
  int price;
  String img;
  int count;
  bool isLike;
  bool isCheck;

  Cart(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.count,
      this.isLike,
      this.isCheck = false});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    count = json['count'];
    isLike = json['isLike'];
    isCheck = json['isCheck'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['count'] = this.count;
    data['isLike'] = this.isLike;
    data['isCheck'] = this.isCheck;
    return data;
  }
}
