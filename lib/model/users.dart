class Users {
  String id,
      name,
      username,
      email,
      //address,
      street,
      city,
      zipcode,
      phone;
  bool isBleeding = false;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    //required this.address,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.phone,
    required this.isBleeding,
  });
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'].toString(),
      name: json['name'],
      username: json['username'],
      email: json['email'],
      //address: json['address'],
      street: json['address']['street'],
      city: json['address']['city'],
      zipcode: json['address']['zipcode'],
      phone: json['phone'],
      isBleeding: true,
    );
  }
}
