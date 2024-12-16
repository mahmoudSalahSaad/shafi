import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int categoryId;

  const CategoryEntity({
    required this.categoryId,
  });
  @override
  List<Object> get props => [categoryId];
}
