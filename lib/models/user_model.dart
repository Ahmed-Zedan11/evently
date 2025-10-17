class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  List<String> favouriteEventIds;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.favouriteEventIds});

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
          email: json["email"],
          name: json["name"],
          id: json["id"],
          favouriteEventIds: (json["favouriteEventIds"] as List<dynamic>)
              .map((favEventId) => favEventId.toString())
              .toList(),
        );

  Map<String, dynamic> tojson() => {
        "id": id,
        "name": name,
        "email": email,
        "favouriteEventIds": favouriteEventIds
      };
}
