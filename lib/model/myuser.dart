class MyUser {
  String name;
  String email;
  String phone;
  String password;
  List<Post> post;
  List<Accept> accept;

  MyUser(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.post,
      this.accept});

  MyUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    if (json['post'] != null) {
      post = new List<Post>();
      json['post'].forEach((v) {
        post.add(new Post.fromJson(v));
      });
    }
    if (json['accept'] != null) {
      accept = new List<Accept>();
      json['accept'].forEach((v) {
        accept.add(new Accept.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    if (this.post != null) {
      data['post'] = this.post.map((v) => v.toJson()).toList();
    }
    if (this.accept != null) {
      data['accept'] = this.accept.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String id;
  String sender;
  String content;
  String senderphone;

  Post({this.id, this.sender, this.content, this.senderphone});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    content = json['content'];
    senderphone = json['senderphone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender'] = this.sender;
    data['content'] = this.content;
    data['senderphone'] = this.senderphone;
    return data;
  }
}

class Accept {
  String id;
  String sender;
  String content;
  String senderphone;

  Accept({this.id, this.sender, this.content, this.senderphone});

  Accept.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    content = json['content'];
    senderphone = json['senderphone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender'] = this.sender;
    data['content'] = this.content;
    data['senderphone'] = this.senderphone;
    return data;
  }
}
