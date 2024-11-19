import 'package:pragma_cats/features/home/domain/entities/weight.dart';

class WeightModel extends Weight {
  WeightModel({
    super.imperial,
    super.metric,
  });

  factory WeightModel.fromJson(Map<String, dynamic> json) => WeightModel(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}
