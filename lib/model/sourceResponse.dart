class SourceResponse {
  SourceResponse({
    this.massage,
    this.code,
    this.status,
    this.source,
  });

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    massage = json['massage'];
    if (json['sources'] != null) {
      source = [];
      json['sources'].forEach((v) {
        source?.add(Source.fromJson(v));
      });
    }
  }

  String? status;
  List<Source>? source;
  String? code;
  String? massage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (source != null) {
      map['sources'] = source?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Source {
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    map['language'] = language;
    map['country'] = country;
    return map;
  }
}
