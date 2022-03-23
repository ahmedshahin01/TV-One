// To parse this JSON data, do
//
//     final showImageModel = showImageModelFromJson(jsonString);

import 'dart:convert';

List<ShowImageModel> showImageModelFromJson(String str) => List<ShowImageModel>.from(json.decode(str).map((x) => ShowImageModel.fromJson(x)));

String showImageModelToJson(List<ShowImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowImageModel {
    ShowImageModel({
        this.id,
        this.type,
        this.main,
        this.resolutions,
    });

    int? id;
    Type? type;
    bool? main;
    Resolutions ?resolutions;

    factory ShowImageModel.fromJson(Map<String, dynamic> json) => ShowImageModel(
        id: json["id"],
        type: typeValues.map?[json["type"]],
        main: json["main"],
        resolutions: Resolutions.fromJson(json["resolutions"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse?[type],
        "main": main,
        "resolutions": resolutions?.toJson(),
    };
}

class Resolutions {
    Resolutions({
        this.original,
        
    });

    Original? original;
    

    factory Resolutions.fromJson(Map<String, dynamic> json) => Resolutions(
        original: Original.fromJson(json["original"]),
       
    );

    Map<String, dynamic> toJson() => {
        "original": original?.toJson(),
      
    };
}

class Original {
    Original({
        this.url,
        this.width,
        this.height,
    });

    String? url;
    int? width;
    int ?height;

    factory Original.fromJson(Map<String, dynamic> json) => Original(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

enum Type { POSTER, BACKGROUND, BANNER }

final typeValues = EnumValues({
    "background": Type.BACKGROUND,
    "banner": Type.BANNER,
    "poster": Type.POSTER
});

class EnumValues<T> {
    Map<String, T> ?map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map?.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
