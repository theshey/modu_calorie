class User {
  final String image;
  final String name;
  final String email;
  final String about;

  const User({
    required this.image,
    required this.name,
    required this.email,
    required this.about,
  });

  User copy({
    String? image,
    String? name,
    String? email,
    String? about,
  }) =>
      User(
        image: image ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    image: json['image'],
    name: json['name'],
    email: json['email'],
    about: json['about'],
  );

  Map<String, dynamic> toJson() => {
    'image': image,
    'name': name,
    'email': email,
    'about': about,
  };
}
