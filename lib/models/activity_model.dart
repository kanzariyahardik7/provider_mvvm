// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) =>
    ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
  Data? data;
  bool? status;
  int? code;
  String? message;

  ActivityModel({
    this.data,
    this.status,
    this.code,
    this.message,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "code": code,
        "message": message,
      };
}

class Data {
  List<Datum>? data;
  Meta? meta;
  Links? links;

  Data({
    this.data,
    this.meta,
    this.links,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
        "links": links?.toJson(),
      };
}

class Datum {
  int? id;
  int? vendorId;
  String? title;
  String? description;
  String? activityDatetime;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;

  Datum({
    this.id,
    this.vendorId,
    this.title,
    this.description,
    this.activityDatetime,
    this.createdAt,
    this.updatedAt,
    this.media,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        vendorId: json["vendor_id"],
        title: json["title"],
        description: json["description"],
        activityDatetime: json["activity_datetime"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "title": title,
        "description": description,
        "activity_datetime": activityDatetime,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  String? manipulations;
  String? customProperties;
  String? generatedConversions;
  String? responsiveImages;
  int? orderColumn;
  dynamic createdAt;
  dynamic updatedAt;
  String? fullUrl;

  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.fullUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        uuid: json["uuid"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        conversionsDisk: json["conversions_disk"],
        size: json["size"],
        manipulations: json["manipulations"],
        customProperties: json["custom_properties"],
        generatedConversions: json["generated_conversions"],
        responsiveImages: json["responsive_images"],
        orderColumn: json["order_column"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        fullUrl: json["fullUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "conversions_disk": conversionsDisk,
        "size": size,
        "manipulations": manipulations,
        "custom_properties": customProperties,
        "generated_conversions": generatedConversions,
        "responsive_images": responsiveImages,
        "order_column": orderColumn,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "fullUrl": fullUrl,
      };
}

class Links {
  String? current;
  String? next;
  String? last;

  Links({
    this.current,
    this.next,
    this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        current: json["current"],
        next: json["next"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "next": next,
        "last": last,
      };
}

class Meta {
  int? itemsPerPage;
  int? totalItems;
  int? currentPage;
  int? totalPages;
  List<List<String>>? sortBy;

  Meta({
    this.itemsPerPage,
    this.totalItems,
    this.currentPage,
    this.totalPages,
    this.sortBy,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        itemsPerPage: json["itemsPerPage"],
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        sortBy: json["sortBy"] == null
            ? []
            : List<List<String>>.from(
                json["sortBy"]!.map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "itemsPerPage": itemsPerPage,
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "sortBy": sortBy == null
            ? []
            : List<dynamic>.from(
                sortBy!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
