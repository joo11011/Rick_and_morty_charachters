class Location {
  late String name;
  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
