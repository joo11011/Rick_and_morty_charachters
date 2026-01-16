class Characters {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Map<String, dynamic>? origin;
  Map<String, dynamic>? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Characters({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    status = json['status'] as String?;
    species = json['species'] as String?;
    type = json['type'] as String?;
    gender = json['gender'] as String?;
    origin = json['origin'] as Map<String, dynamic>?;
    location = json['location'] as Map<String, dynamic>?;
    image = json['image'] as String?;
    episode = (json['episode'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
    url = json['url'] as String?;
    created = json['created'] as String?;
  }
}
