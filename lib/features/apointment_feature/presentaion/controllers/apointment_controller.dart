import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/apointment_times_entity.dart';
import 'package:shafi/features/apointment_feature/domain/entity/confirm_entity.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/booking_submetion_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_booking_avalibale_times_use_case.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/category_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/doctors_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/questions_controller.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/features/home_feature/domain/use_cases/get_apointments_use_case.dart';

part 'apointment_controller.freezed.dart';
part 'apointment_controller.g.dart';
part 'apointment_state.dart';

@Riverpod(keepAlive: true)
class ApointmentController extends _$ApointmentController {
  @override

  /// Initializes the [ApointmentController] by fetching the user's appointments.
  ///
  /// This method is called when the widget is first created and should not be
  /// called manually.
  ///
  /// The [ApointmentState] is set to [AsyncData] with an empty [ApointmentState]
  /// and then the [getMyApointments] method is called to fetch the user's
  /// appointments.
  ///
  /// Returns a [Future] containing the [ApointmentState].
  @override

  /// Initializes the [ApointmentController] by fetching the user's appointments.
  ///
  /// This method is called when the widget is first created and should not be
  /// called manually.
  ///
  /// The [ApointmentState] is set to [AsyncData] with an empty [ApointmentState]
  /// and then the [getMyApointments] method is called to fetch the user's
  /// appointments.
  ///
  /// Returns a [Future] containing the [ApointmentState].
  @override
  Future<ApointmentState> build() async {
    /// Set the state to [AsyncData] with an empty [ApointmentState].
    state = AsyncData(ApointmentState());

    /// Call the [getMyApointments] method to fetch the user's appointments.
    await getMyApointments();

    /// Return the [ApointmentState].
    return state.requireValue;
  }

  getApointmentTimes() async {
    selectedtime(time: null);
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    GetBookingAvalibaleTimesUseCase getBookingAvalibaleTimesUseCase = getIt();
    final result = await getBookingAvalibaleTimesUseCase.call(
      ApointmentTimesEntity(
          apointmentDate: state.requireValue.selectedDate.toString(),
          doctorId: state.requireValue.selectedDoctor!.id!,
          type: ref
              .read(doctorsControllerProvider)
              .requireValue
              .selectedDoctorType),
    );

    result.fold(
      (l) {
        Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
      },
      (r) {
        state = AsyncData(
          state.requireValue.copyWith(apointmentTimes: r.data),
        );
      },
    );
  }

  selectedtime({String? time}) {
    state = AsyncData(state.requireValue.copyWith(selectedApointment: time));
  }

  clearSelection() {
    state = AsyncData(state.requireValue.copyWith(selectedApointment: null));
  }

  selectDate({required String date}) {
    state = AsyncData(state.requireValue.copyWith(selectedDate: date));
  }

  clearDate() {
    state = AsyncData(state.requireValue.copyWith(selectedDate: null));
  }

  selectDoctor({required DoctorModel doctor}) {
    state = AsyncData(
      state.requireValue.copyWith(
        selectedDoctor: doctor,
      ),
    );
  }

  clearAlldata() {
    state = AsyncData(ApointmentState());
  }

  bookSubmition() async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });

    BookingSubmetionUseCase bookingSubmetionUseCase = getIt();
    final result = await bookingSubmetionUseCase.call(ConfirmEntity(
      doctorId: state.requireValue.selectedDoctor!.id!,
      answers: ref.read(questionsControllerProvider).requireValue.answers,
      categoryId: ref
          .read(categoryControllerProvider)
          .requireValue
          .selectedCategory!
          .id
          .toString(),
      date: state.requireValue.selectedDate.toString(),
      startTime: state.requireValue.selectedApointment!,
      subCategoryId: "",
      type: state.requireValue.type,
      perName: state.requireValue.perName,
      perSSN: state.requireValue.perSsn,
    ));

    result.fold((l) {
      Alerts.showSnackBar(
        "${l.errorMessage}",
      );
      state = AsyncError("${l.errorMessage}", StackTrace.current);
    }, (r) {
      Alerts.showSnackBar("${r.message}", alertsType: AlertsType.success);

      state = AsyncData(ApointmentState());
      getMyApointments();

      NavigationService.pushNamedAndRemoveUntil(
          Routes.bottomNavigationBarScreen);
    });
  }

  getMyApointments() async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    GetApointmentsUseCase getApointmentsUseCase = getIt();
    final result = await getApointmentsUseCase.call(
      NoParameters(),
    );

    result.fold(
      (l) {
        Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
        state = AsyncError("${l.errorMessage}", StackTrace.current);
      },
      (r) {
        state = AsyncData(
          state.requireValue.copyWith(myApointments: r),
        );
      },
    );
  }

  setApointtmentType({required String type}) {
    state = AsyncData(state.requireValue.copyWith(type: type));
  }

  setAppointmentNameAndSsn({required String name, required String ssn}) {
    state = AsyncData(
      state.requireValue.copyWith(
        perName: name,
        perSsn: ssn,
      ),
    );
  }
}
