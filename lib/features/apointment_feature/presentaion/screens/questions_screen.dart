import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/data/models/questions_model.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/questions_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/doctors_list_screen.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';
import 'package:shimmer/shimmer.dart';

class QuestionsScreen extends ConsumerStatefulWidget {
  const QuestionsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionsScreenState();
}

class _QuestionsScreenState extends ConsumerState<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                buttonText: S.of(context).go_to_summary,
                textColor: kAppBarColor,
                backgroundColor: primaryColorDark,
                radius: 10.r,
                onTap: () {
                  NavigationService.push(Routes.apointmentSummaryScreen);
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: CustomText(
          S.of(context).answer_the_questions,
          size: 14.h,
          bold: true,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: deviceWidth,
        child: ref.watch(questionsControllerProvider).when(
              data: (data) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 104.h, left: 16.w, right: 16.w, top: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(data.questions.length, (index) {
                        if (data.questions[index].type == "text") {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: QuestionTypeTextWidget(
                              questionsModel: data.questions[index],
                            ),
                          );
                        } else if (data.questions[index].type == "radio") {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: QuestionRadioWidget(
                              questionsModel: data.questions[index],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: QuestionCheckBoxWidget(
                              questionsModel: data.questions[index],
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                );
              },
              error: (error, _) => CustomText(error.toString()),
              loading: () => Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(16.0.h),
                  child: Column(
                    children: List.generate(10, (index) {
                      return DoctorCardWidget(
                          doctorModel: DoctorModel(name: "Loading.........."));
                    }),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class QuestionCheckBoxWidget extends ConsumerWidget {
  const QuestionCheckBoxWidget({
    super.key,
    required this.questionsModel,
  });
  final QuestionsModel questionsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: AppColorLight().kAppBarColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 0),
              blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "${questionsModel.question}",
            size: 16.h,
            bold: true,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                (questionsModel.options ?? []).length,
                (index2) => InkWell(
                      onTap: () {
                        ref
                            .read(questionsControllerProvider.notifier)
                            .addAnswer(
                                question: questionsModel,
                                answer: questionsModel.options![index2].name
                                    .toString());
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: AppColorLight().kAppBarColor,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  offset: Offset(0, 0),
                                  blurRadius: 10)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              "${questionsModel.options?[index2].name}",
                              size: 16.h,
                            ),
                            Checkbox(
                                activeColor: primaryColorDark,
                                value: ref
                                        .read(questionsControllerProvider)
                                        .requireValue
                                        .answers
                                        .any((e) =>
                                            e.questionId == questionsModel.id)
                                    ? ref
                                            .read(questionsControllerProvider)
                                            .requireValue
                                            .answers
                                            .any((e) =>
                                                e.answer ==
                                                questionsModel
                                                    .options![index2].name)
                                        ? true
                                        : false
                                    : false,
                                onChanged: (value) {})
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}

class QuestionRadioWidget extends ConsumerWidget {
  const QuestionRadioWidget({
    super.key,
    required this.questionsModel,
  });
  final QuestionsModel questionsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: AppColorLight().kAppBarColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, 0),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "${questionsModel.question}",
            size: 16.h,
            bold: true,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              (questionsModel.options ?? []).length,
              (index2) => InkWell(
                onTap: () {
                  ref.read(questionsControllerProvider.notifier).addAnswer(
                      question: questionsModel,
                      childrinQ: questionsModel.options![index2].children,
                      answer: questionsModel.options![index2].name.toString());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 0),
                            blurRadius: 10.r)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        "${questionsModel.options?[index2].name}",
                        size: 14.h,
                      ),
                      Radio<String>(
                          value: questionsModel.options![index2].name!,
                          activeColor: primaryColorDark,
                          groupValue: ref
                                  .read(questionsControllerProvider)
                                  .requireValue
                                  .answers
                                  .any((e) => e.questionId == questionsModel.id)
                              ? ref
                                      .read(questionsControllerProvider)
                                      .requireValue
                                      .answers
                                      .any((e) =>
                                          e.answer ==
                                          questionsModel.options![index2].name)
                                  ? questionsModel.options![index2].name
                                  : ""
                              : "",
                          onChanged: (val) {
                            ref
                                .read(questionsControllerProvider.notifier)
                                .addAnswer(
                                    question: questionsModel,
                                    childrinQ: questionsModel
                                        .options![index2].children,
                                    answer: questionsModel.options![index2].name
                                        .toString());
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ref.watch(questionsControllerProvider).requireValue.childrinQ != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: QuestionTypeTextWidget(
                    questionsModel: QuestionsModel(
                      id: ref
                          .watch(questionsControllerProvider)
                          .requireValue
                          .childrinQ!
                          .id,
                      question: ref
                          .watch(questionsControllerProvider)
                          .requireValue
                          .childrinQ!
                          .question,
                      type: ref
                          .watch(questionsControllerProvider)
                          .requireValue
                          .childrinQ!
                          .type,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class QuestionTypeTextWidget extends ConsumerStatefulWidget {
  const QuestionTypeTextWidget({
    super.key,
    required this.questionsModel,
  });
  final QuestionsModel questionsModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuestionTypeTextWidgetState();
}

class _QuestionTypeTextWidgetState
    extends ConsumerState<QuestionTypeTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: AppColorLight().kAppBarColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 0),
              blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "${widget.questionsModel.question}",
            size: 16.h,
            bold: true,
          ),
          SizedBox(
            height: 6.h,
          ),
          CustomTextField(
            isPassword: false,
            hint: "",
            maxLines: 5,
            onChange: (val) {
              ref.read(questionsControllerProvider.notifier).addAnswer(
                  question: widget.questionsModel, answer: val.toString());
            },
            prefixIcon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0.h),
                  child: Icon(
                    Icons.question_answer,
                    color: primaryColorDark,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



/// hndif l objext bta3 question
/// hn3ml function add kol shakl question 
/// hdifhom kolhom fil list 
/// loop -- submit 