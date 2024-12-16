import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/features/apointment_feature/data/models/answer_model.dart';
import 'package:shafi/features/apointment_feature/data/models/questions_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/category_entity.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_question_use_case.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/category_controller.dart';

part 'questions_controller.freezed.dart';
part 'questions_controller.g.dart';
part 'questions_state.dart';

@riverpod
class QuestionsController extends _$QuestionsController {
  @override

  /// Initializes the [QuestionsController] by calling [getQuesttions] and
  /// updating the [state] with the result.
  ///
  /// This method is called when the [QuestionsController] is created.
  ///
  /// It returns a [Future] which completes with the [QuestionsState] after
  /// the questions have been loaded.
  ///
  /// The [state] is updated with [AsyncLoading] initially and then with
  /// [AsyncData] containing the [QuestionsState] when the questions are
  /// loaded.
  ///
  /// If an error occurs while loading the questions, the [state] is updated
  /// with [AsyncError] containing the error.
  @override
  Future<QuestionsState> build() async {
    state = AsyncData(QuestionsState());
    try {
      await getQuesttions();
      return state.requireValue;
    } on Object catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }

  getQuesttions() async {
    GetQuestionUseCase getQuestionUseCase = getIt();
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    final result = await getQuestionUseCase.call(CategoryEntity(
        categoryId: ref
            .read(categoryControllerProvider)
            .requireValue
            .selectedSubCategory!
            .id!));
    result.fold((l) {
      state = AsyncError("${l.errorMessage}", StackTrace.current);
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(questions: r));
    });
  }

  addAnswer({required QuestionsModel question, required String answer}) {
    int index = state.requireValue.answers
        .indexWhere((e) => e.questionId == question.id);
    if (index != -1) {
      List<AnswerModel> temp = state.requireValue.answers.toList();
      temp[index] = temp[index].copyWith(answer: answer);
      if (answer.isEmpty || answer == "null") {
        state = AsyncData(state.requireValue.copyWith(
            answers: [...state.requireValue.answers]..remove(temp[index])));
      } else {
        state = AsyncData(state.requireValue.copyWith(answers: temp));
      }
    } else {
      AnswerModel newAnswer = AnswerModel(
          questionId: question.id, title: question.question, answer: answer);

      state = AsyncData(
        state.requireValue.copyWith(
          answers: [...state.requireValue.answers, newAnswer],
        ),
      );
    }

    print(state.requireValue.answers.toList());
  }
}
