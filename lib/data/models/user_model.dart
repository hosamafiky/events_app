class User {
  late String name;
  late String email;
  late String phone;
  late String id;
  late String token;
  late String password;
  late String confirmPassword;
  late String address;
  late String type;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.token,
    required this.password,
    required this.confirmPassword,
    required this.address,
    required this.type,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['_id'];
    token = json['token'] ?? '';
    password = json['password'];
    address = json['address'] ?? '';
    type = json['type'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      '_id': id,
      'token': token,
      'password': password,
      'confirmPassword': confirmPassword,
      'address': address,
      'type': type,
    };
  }
}
