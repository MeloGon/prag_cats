import 'package:pragma_cats/features/home/domain/entities/cat_image.dart';

class CatImageModel extends CatImage {
  CatImageModel({
    super.id,
    super.width,
    super.height,
    super.url,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) => CatImageModel(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}
