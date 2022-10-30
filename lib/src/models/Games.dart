import 'package:meta/meta.dart';
import 'dart:convert';

Games gamesFromJson(String str) => Games.fromJson(json.decode(str));

String gamesToJson(Games data) => json.encode(data.toJson());

class Games {
  Games({
     this.id,
     this.title,
     this.thumbnail,
     this.status,
     this.shortDescription,
     this.description,
     this.gameUrl,
     this.genre,
     this.platform,
     this.publisher,
     this.developer,
     this.releaseDate,
     this.freetogameProfileUrl,
     this.minimumSystemRequirements,
     this.screenshots,
  });

  final int? id;
  final String? title;
  final String? thumbnail;
  final String? status;
  final String? shortDescription;
  final String? description;
  final String? gameUrl;
  final String? genre;
  final String? platform;
  final String? publisher;
  final String? developer;
  final DateTime? releaseDate;
  final String? freetogameProfileUrl;
  final MinimumSystemRequirements? minimumSystemRequirements;
  final List<Screenshot>? screenshots;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        status: json["status"] ?? "",
        shortDescription: json["short_description"] ?? "",
        description: json["description"] ?? "",
        gameUrl: json["game_url"] ?? "",
        genre: json["genre"] ?? "",
        platform: json["platform"] ?? "",
        publisher: json["publisher"] ?? "",
        developer: json["developer"] ?? "",
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"] ?? "",
        minimumSystemRequirements: json["minimum_system_requirements"] == null
            ? null
            : MinimumSystemRequirements.fromJson(
                json["minimum_system_requirements"]),
        screenshots: json["screenshots"] == null
            ? []
            : List<Screenshot>.from(
                json["screenshots"].map((x) => Screenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "status": status,
        "short_description": shortDescription,
        "description": description,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "freetogame_profile_url": freetogameProfileUrl,
        "minimum_system_requirements": minimumSystemRequirements == null
            ? null
            : minimumSystemRequirements?.toJson(),
        "screenshots": screenshots == null
            ? null
            : List<dynamic>.from(screenshots!.map((x) => x.toJson())),
      };
}

class MinimumSystemRequirements {
  MinimumSystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });

  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) =>
      MinimumSystemRequirements(
        os: json["os"] ?? "",
        processor: json["processor"] ?? "",
        memory: json["memory"] ?? "",
        graphics: json["graphics"] ?? "",
        storage: json["storage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "os": os,
        "processor": processor,
        "memory": memory,
        "graphics": graphics,
        "storage": storage,
      };
}

class Screenshot {
  Screenshot({
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
