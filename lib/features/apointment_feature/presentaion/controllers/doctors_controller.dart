import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/apointment_times_entity.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_doctors_use_case.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';

part 'doctors_controller.freezed.dart';
part 'doctors_controller.g.dart';
part 'doctors_state.dart';

@riverpod
class DoctorsController extends _$DoctorsController {
  @override

  /// Builds the DoctorsState asynchronously by fetching doctors data.
  ///
  /// This function sets the initial state to AsyncData with an empty DoctorsState,
  /// then calls [getDoctors] to fetch the doctors data.
  /// Returns the updated DoctorsState.
  Future<DoctorsState> build() async {
    // Set the initial state to AsyncData with an empty DoctorsState
    state = AsyncData(DoctorsState());

    // Fetch the doctors data
    await getDoctors(
        appointmentDay:
            ref.read(apointmentControllerProvider).requireValue.selectedDate!);
    // Return the updated state
    return state.requireValue;
  }

  getDoctors({required String appointmentDay}) async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });

    GetDoctorsUseCase getDoctorsUseCase = getIt();
    final result = await getDoctorsUseCase.call(
        ApointmentTimesEntity(doctorId: 1, apointmentDate: appointmentDay));
    result.fold(
      (l) {
        state = AsyncError("${l.errorMessage}", StackTrace.current);
      },
      (r) {
        state = AsyncData(DoctorsState(doctors: r));
      },
    );
  }

  selectdoctor({required DoctorModel doctor}) {
    state = AsyncData(
      state.requireValue.copyWith(selectedDoctor: doctor),
    );
    ref
        .read(apointmentControllerProvider.notifier)
        .selectDoctor(doctor: doctor);
    ref.read(apointmentControllerProvider.notifier).getApointmentTimes();
    NavigationService.push(Routes.apointmentTimesScreen);
  }
}
