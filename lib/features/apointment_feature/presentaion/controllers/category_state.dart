part of 'category_controller.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  factory CategoryState(
      {@Default([]) final List<CategoryModel> categories,
      @Default([]) final List<CategoryModel> subCategries,
      final CategoryModel? selectedCategory,
      final CategoryModel? selectedSubCategory}) = _CategoryState;
}
