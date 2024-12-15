// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryState {
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<CategoryModel> get subCategries => throw _privateConstructorUsedError;
  CategoryModel? get selectedCategory => throw _privateConstructorUsedError;
  CategoryModel? get selectedSubCategory => throw _privateConstructorUsedError;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryModel> subCategries,
      CategoryModel? selectedCategory,
      CategoryModel? selectedSubCategory});

  $CategoryModelCopyWith<$Res>? get selectedCategory;
  $CategoryModelCopyWith<$Res>? get selectedSubCategory;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? subCategries = null,
    Object? selectedCategory = freezed,
    Object? selectedSubCategory = freezed,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      subCategries: null == subCategries
          ? _value.subCategries
          : subCategries // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      selectedSubCategory: freezed == selectedSubCategory
          ? _value.selectedSubCategory
          : selectedSubCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ) as $Val);
  }

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get selectedCategory {
    if (_value.selectedCategory == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.selectedCategory!, (value) {
      return _then(_value.copyWith(selectedCategory: value) as $Val);
    });
  }

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res>? get selectedSubCategory {
    if (_value.selectedSubCategory == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.selectedSubCategory!, (value) {
      return _then(_value.copyWith(selectedSubCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryStateImplCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$CategoryStateImplCopyWith(
          _$CategoryStateImpl value, $Res Function(_$CategoryStateImpl) then) =
      __$$CategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryModel> subCategries,
      CategoryModel? selectedCategory,
      CategoryModel? selectedSubCategory});

  @override
  $CategoryModelCopyWith<$Res>? get selectedCategory;
  @override
  $CategoryModelCopyWith<$Res>? get selectedSubCategory;
}

/// @nodoc
class __$$CategoryStateImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateImpl>
    implements _$$CategoryStateImplCopyWith<$Res> {
  __$$CategoryStateImplCopyWithImpl(
      _$CategoryStateImpl _value, $Res Function(_$CategoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? subCategries = null,
    Object? selectedCategory = freezed,
    Object? selectedSubCategory = freezed,
  }) {
    return _then(_$CategoryStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      subCategries: null == subCategries
          ? _value._subCategries
          : subCategries // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      selectedSubCategory: freezed == selectedSubCategory
          ? _value.selectedSubCategory
          : selectedSubCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }
}

/// @nodoc

class _$CategoryStateImpl implements _CategoryState {
  _$CategoryStateImpl(
      {final List<CategoryModel> categories = const [],
      final List<CategoryModel> subCategries = const [],
      this.selectedCategory,
      this.selectedSubCategory})
      : _categories = categories,
        _subCategries = subCategries;

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryModel> _subCategries;
  @override
  @JsonKey()
  List<CategoryModel> get subCategries {
    if (_subCategries is EqualUnmodifiableListView) return _subCategries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategries);
  }

  @override
  final CategoryModel? selectedCategory;
  @override
  final CategoryModel? selectedSubCategory;

  @override
  String toString() {
    return 'CategoryState(categories: $categories, subCategries: $subCategries, selectedCategory: $selectedCategory, selectedSubCategory: $selectedSubCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._subCategries, _subCategries) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedSubCategory, selectedSubCategory) ||
                other.selectedSubCategory == selectedSubCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_subCategries),
      selectedCategory,
      selectedSubCategory);

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      __$$CategoryStateImplCopyWithImpl<_$CategoryStateImpl>(this, _$identity);
}

abstract class _CategoryState implements CategoryState {
  factory _CategoryState(
      {final List<CategoryModel> categories,
      final List<CategoryModel> subCategries,
      final CategoryModel? selectedCategory,
      final CategoryModel? selectedSubCategory}) = _$CategoryStateImpl;

  @override
  List<CategoryModel> get categories;
  @override
  List<CategoryModel> get subCategries;
  @override
  CategoryModel? get selectedCategory;
  @override
  CategoryModel? get selectedSubCategory;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
