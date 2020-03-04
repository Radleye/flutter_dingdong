class User {
  String name;
  String phone;
  String email;
  String password;

  User({
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  User.fromJson(Map json) {
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}
