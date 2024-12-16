import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/category_entity.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_categories_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_sub_category_use_case.dart';

part 'category_controller.freezed.dart';
part 'category_controller.g.dart';
part 'category_state.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  /// Initializes the controller by fetching the categories
  ///
  /// This method must be called before the widget is built.
  /// It will fetch the categories and update the state.
  ///
  /// Returns the initial state of the controller.
  ///
  /// The state will be [AsyncData] with the categories.
  Future<CategoryState> build() async {
    // Initialize the state with an empty state
    state = AsyncData(CategoryState());

    // Fetch the categories
    await getCategories();

    // Return the state
    return state.requireValue;
  }

  getCategories() async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    GetCategoriesUseCase getCategoriesUseCase = getIt();
    final result = await getCategoriesUseCase.call(NoParameters());
    result.fold((l) {
      state = AsyncError("${l.errorMessage}", StackTrace.current);
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(categories: r));
    });
  }

  selectCategory(CategoryModel category) {
    state = AsyncData(state.requireValue.copyWith(selectedCategory: category));
  }

  getSubCategory({required CategoryModel category}) async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    GetSubCategoryUseCase getSubCategoryUseCase = getIt();
    final result = await getSubCategoryUseCase
        .call(CategoryEntity(categoryId: category.id!));
    result.fold((l) {
      state = AsyncError("${l.errorMessage}", StackTrace.current);
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(subCategries: r));
    });
  }

  selectSubCategory(CategoryModel subCategory) {
    state = AsyncData(
        state.requireValue.copyWith(selectedSubCategory: subCategory));
  }
}
