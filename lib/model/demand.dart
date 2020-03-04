class Demand {
  String name;
  String content;
  String phone;
  String id1;

  Demand({this.name, this.content, this.phone, this.id1});

  Demand.fromJson(Map<String, dynamic> json, String i) {
    name = json['name'];
    content = json['content'];
    phone = json['phone'];
    id1 = i ?? ' ';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['content'] = this.content;
    data['phone'] = this.phone;
    return data;
  }
}
