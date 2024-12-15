import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/features/home_feature/domain/use_cases/get_apointment_dates_use_case.dart';

part 'get_apointment_dates_controllers.freezed.dart';
part 'get_apointment_dates_controllers.g.dart';
part 'get_apointment_dates_state.dart';

@riverpod
class GetApointmentDatesController extends _$GetApointmentDatesController {
  @override

  /// Fetches the list of available dates for appointment scheduling and
  /// updates the state with the result.
  ///
  /// Returns a [Future] that completes with the updated [GetApointmentDatesState].
  @override
  Future<GetApointmentDatesState> build() async {
    // Set the state to a loading state
    state = AsyncData(GetApointmentDatesState());

    GetApointmentDatesUseCase getApointmentDatesUseCase = getIt();

    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });

    // Fetch the list of available dates
    final result = await getApointmentDatesUseCase.call(
      NoParameters(),
    );
 
    // Update the state with the result
    result.fold(
        (error) =>
            AsyncError(error.errorMessage.toString(), StackTrace.current),
        (dates) {
      print("dataaatatetetete======>$dates");
      state = AsyncData(
          state.requireValue.copyWith(dates: dates.reversed.toList()));
    });

    // Return the updated state
    return state.requireValue;
  }
}
