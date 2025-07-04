import 'package:freezed_annotation/freezed_annotation.dart';

part 'questions_model.freezed.dart';
part 'questions_model.g.dart';

@freezed
abstract class QuestionsModel with _$QuestionsModel {
  factory QuestionsModel({final int? id, final String? question , final String? type , final List<Options>? options } ) = _QuestionsModel;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);
}


@freezed
abstract class Options with _$Options {
  factory Options({final int? id, final String? name , Children? children} ) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}





@freezed
class Children with _$Children {

  factory Children(
    {
      final int? id,
      final String? question , 
      final String? type ,
    }
  ) = _Children;

  factory Children.fromJson(Map<String, dynamic> json) => _$ChildrenFromJson(json);
}
