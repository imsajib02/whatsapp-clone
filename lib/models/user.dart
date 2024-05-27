class User {

  String? id;
  String? name;
  String? email;
  String? phone;
  String? photoUrl;

  User({this.id, this.name, this.email, this.phone, this.photoUrl});

  User.fromJson(dynamic json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    photoUrl = json['photoUrl'] ?? "";
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
    };
  }
}