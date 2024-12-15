part of 'questions_controller.dart';

@freezed
abstract class QuestionsState with _$QuestionsState {
  factory QuestionsState({
    @Default([])  final List<QuestionsModel> questions,
    @Default([]) final List<AnswerModel> answers , 
  }) = _QuestionsState;
}
