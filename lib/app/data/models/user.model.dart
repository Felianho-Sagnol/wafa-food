class User {
  int? id = 0;
  final String? fulname;
  final String? email;
  final String? phone;
  final String? password;

  User({
    this.id = 0,
    this.fulname,
    this.email,
    this.phone,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fulname: json['fulname'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fulname': fulname,
        'email': email,
        'phone': phone,
        'password': password,
      };
}
