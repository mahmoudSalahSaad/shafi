import 'package:equatable/equatable.dart';
import 'package:shafi/features/apointment_feature/data/models/answer_model.dart';

class ConfirmEntity extends Equatable {
  final int doctorId;
  final List<AnswerModel> answers;
  final String startTime;
  final String categoryId;
  final String subCategoryId;
  final String date;
  final String? type;
  final String? perSSN;
  final String? perName;

  const ConfirmEntity(
      {required this.doctorId,
      this.perSSN,
      this.perName,
      required this.answers,
      required this.categoryId,
      required this.date,
      required this.startTime,
      required this.type,
      required this.subCategoryId});
  @override
  List<Object> get props => [
        doctorId,
        answers,
        categoryId,
        subCategoryId,
        date,
        startTime,
      ];
}
