// To parse this JSON data, do
//
//     final episodes = episodesFromJson(jsonString);

import 'dart:convert';

List<EpisodesModel> episodesFromJson(String str) => List<EpisodesModel>.from(json.decode(str).map((x) => EpisodesModel.fromJson(x)));

String episodesToJson(List<EpisodesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EpisodesModel {
    EpisodesModel({
        this.id,
        this.url,
        this.name,
        this.season,
        this.number,
        this.type,
        this.airdate,
        this.airtime,
        this.airstamp,
        this.runtime,
        this.rating,
        this.image,
        this.summary,
        this.links,
    });

    int? id;
    String? url;
    String ?name;
    int? season;
    int ?number;
    Type ?type;
    DateTime? airdate;
    Airtime? airtime;
    DateTime ?airstamp;
    int? runtime;
    Rating ?rating;
    Image ?image;
    String ?summary;
    Links? links;

    factory EpisodesModel.fromJson(Map<String, dynamic> json) => EpisodesModel(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        season: json["season"],
        number: json["number"],
        type: typeValues.map?[json["type"]],
        airdate: DateTime.parse(json["airdate"]),
        airtime: airtimeValues.map?[json["airtime"]],
        airstamp: DateTime.parse(json["airstamp"]),
        runtime: json["runtime"],
        rating: Rating.fromJson(json["rating"]),
        image: Image.fromJson(json["image"]),
        summary: json["summary"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "season": season,
        "number": number,
        "type": typeValues.reverse?[type],
        "airdate": "${airdate?.year.toString().padLeft(4, '0')}-${airdate?.month.toString().padLeft(2, '0')}-${airdate?.day.toString().padLeft(2, '0')}",
        "airtime": airtimeValues.reverse?[airtime],
        "airstamp": airstamp?.toIso8601String(),
        "runtime": runtime,
        "rating": rating?.toJson(),
        "image": image?.toJson(),
        "summary": summary,
        "_links": links?.toJson(),
    };
}

enum Airtime { THE_2100, THE_2200 }

final airtimeValues = EnumValues({
    "21:00": Airtime.THE_2100,
    "22:00": Airtime.THE_2200
});

class Image {
    Image({
        this.medium,
        this.original,
    });

    String? medium;
    String? original;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class Links {
    Links({
        this.self,
    });

    Self? self;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
    };
}

class Self {
    Self({
        this.href,
    });

    String ?href;

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Rating {
    Rating({
        this.average,
    });

    double? average;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}

enum Type { REGULAR }

final typeValues = EnumValues({
    "regular": Type.REGULAR
});

class EnumValues<T> {
    Map<String, T> ?map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map?.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
