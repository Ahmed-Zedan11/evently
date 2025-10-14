class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;

  UserModel({required this.id, required this.name, required this.email});

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
          email: json["email"],
          name: json["name"],
          id: json["id"],
        );

  Map<String, dynamic> tojson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
