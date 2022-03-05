import 'dart:convert';

import 'package:equatable/equatable.dart';

List<PicsumModel> picsumModelFromJson(String str) => List<PicsumModel>.from(json.decode(str).map((x) => PicsumModel.fromJson(x)));

class PicsumModel extends Equatable {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  PicsumModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory PicsumModel.fromJson(Map<String, dynamic> json) => PicsumModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['author'] = author;
    map['width'] = width;
    map['height'] = height;
    map['url'] = url;
    map['download_url'] = downloadUrl;
    return map;
  }

  @override
  List<Object?> get props => [id, url, downloadUrl];
}
