class Demand {
  String name;
  String content;
  String phone;
  String id1;
  String address;

  Demand({this.name, this.content, this.phone, this.id1, this.address});

  Demand.fromJson(Map<String, dynamic> json, String i) {
    name = json['name'];
    content = json['content'];
    phone = json['phone'];
    id1 = i ?? ' ';
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['content'] = this.content;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}
