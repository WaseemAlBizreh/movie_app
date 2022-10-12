import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] ?? "/hT3OqvzMqCQuJsUjZnQwA5NuxgK.jpg",
      id: json['id'],
    );
  }
}
