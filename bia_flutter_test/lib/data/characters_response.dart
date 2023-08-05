// To parse this JSON data, do
//
//     final charactersResponse = charactersResponseFromJson(jsonString);

import 'dart:convert';

CharactersResponse charactersResponseFromJson(String str) =>
    CharactersResponse.fromJson(json.decode(str));

String charactersResponseToJson(CharactersResponse data) =>
    json.encode(data.toJson());

class CharactersResponse {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  Data? data;
  String? etag;

  CharactersResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.data,
    this.etag,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      CharactersResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        etag: json["etag"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": data?.toJson(),
        "etag": etag,
      };
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? name;
  String? description;
  String? modified;
  String? resourceUri;
  List<Url>? urls;
  Thumbnail? thumbnail;
  Comics? comics;
  Stories? stories;
  Comics? events;
  Comics? series;

  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceUri,
    this.urls,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.series,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromJson(x))),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        comics: json["comics"] == null ? null : Comics.fromJson(json["comics"]),
        stories:
            json["stories"] == null ? null : Stories.fromJson(json["stories"]),
        events: json["events"] == null ? null : Comics.fromJson(json["events"]),
        series: json["series"] == null ? null : Comics.fromJson(json["series"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "resourceURI": resourceUri,
        "urls": urls == null
            ? []
            : List<dynamic>.from(urls!.map((x) => x.toJson())),
        "thumbnail": thumbnail?.toJson(),
        "comics": comics?.toJson(),
        "stories": stories?.toJson(),
        "events": events?.toJson(),
        "series": series?.toJson(),
      };
}

class Comics {
  int? available;
  int? returned;
  String? collectionUri;
  List<ComicsItem>? items;

  Comics({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<ComicsItem>.from(
                json["items"]!.map((x) => ComicsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ComicsItem {
  String? resourceUri;
  String? name;

  ComicsItem({
    this.resourceUri,
    this.name,
  });

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  int? available;
  int? returned;
  String? collectionUri;
  List<StoriesItem>? items;

  Stories({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<StoriesItem>.from(
                json["items"]!.map((x) => StoriesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class StoriesItem {
  String? resourceUri;
  String? name;
  String? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  String? type;
  String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
