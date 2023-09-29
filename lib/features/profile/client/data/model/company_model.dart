class CompanyModel {
  final String name,
      email,
      phone,
      image,
      description,
      address,
      license,
      category,
      from,
      to;
  final List images, workingDays;final List latlong;
  final List workingHours;
  final int rating;

  const CompanyModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.description,
    required this.images,
    required this.workingDays,
    required this.workingHours,
    required this.rating,
    required this.address,
    required this.license,
    required this.latlong,
    required this.category,
    required this.from,
    required this.to,
  });
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      description: json['description'],
      images: json['images'],
      workingDays: json['workingDays'],
      workingHours: json['workingHours'],
      rating: json['rating'],
      latlong: json['latlong'],
      address: json['address'],
      license: json['license'],
      category: json['category'],
      from: json['from'],
      to: json['to'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'phone': phone,
      'email': email,
      'description': description,
      'images': images,
      'workingDays': workingDays,
      'workingHours': workingHours,
      'rating': rating,
      'category': category,
      'latlong': latlong,
      'address': address,
      'license': license,
      'from': from,
      'to': to,
    };
  }
}
