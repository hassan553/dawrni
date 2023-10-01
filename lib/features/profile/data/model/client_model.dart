class ClientModel {
  final String name, email, phone, image;
  const ClientModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
  });
  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        image: json['image']);
  }
  Map toMap() {
    return {
      'name':name,
      'image':image,
      'phone':phone,
      'email':email,
    };
  }
}
