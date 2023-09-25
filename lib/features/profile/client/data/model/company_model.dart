class CompanyModel {
  final String name, email, phone, image, description;
  final List images, workingDays;
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
    };
  }
}
