
import 'package:hive/hive.dart';
part 'rating_model.g.dart';
@HiveType(typeId: 1, adapterName: "RatingAdapter")

class Rating {
  @HiveField(0)
  double rate;
  @HiveField(1)
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}