import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntity rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.category,
    required this.image,
  });

  @override
  List<Object> get props => [
        id,
        title,
        price,
        rating,
        description,
        category,
        image,
      ];
}

class RatingEntity extends Equatable {
  final double rate;
  final int count;

  const RatingEntity({
    required this.rate,
    required this.count,
  });

  factory RatingEntity.fromJson(Map<String, dynamic> json) {
    return RatingEntity(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }

  @override
  List<Object> get props => [
        rate,
        count,
      ];
}
