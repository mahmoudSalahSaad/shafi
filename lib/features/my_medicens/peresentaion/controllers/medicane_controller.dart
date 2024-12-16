import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/features/my_medicens/data/models/medicane_model.dart';
import 'package:shafi/features/my_medicens/domain/entity/medicane_entity.dart';
import 'package:shafi/features/my_medicens/domain/use_cases/add_medicane_use_case.dart';
import 'package:shafi/features/my_medicens/domain/use_cases/get_medical_history_use_case.dart';

part 'medicane_controller.freezed.dart';
part 'medicane_controller.g.dart';
part 'medicane_state.dart';

@riverpod
class MedicaneController extends _$MedicaneController {
  @override
  Future<MedicaneState> build() async {
    state = AsyncData(MedicaneState());
    await getMedicanes();
    return state.requireValue;
  }

  getMedicanes() async {
    GetMedicalHistoryUseCase getMedicalHistoryUseCase = getIt();
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });

    final response = await getMedicalHistoryUseCase.call(NoParameters());
    response.fold((error) {
      state = AsyncError(error, StackTrace.current);
    }, (medicanes) {
      state = AsyncData(MedicaneState(medicanes: medicanes));
    });
  }

  addMedicane(MedicaneEntity medicane) async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    AddMedicaneUseCase addMedicaneUseCase = getIt();

    final response = await addMedicaneUseCase.call(medicane);
    response.fold((error) {
      state = AsyncError(error, StackTrace.current);
    }, (medicanes) {
      state = AsyncData(state.requireValue.copyWith(
          medicanes: [medicanes, ...state.requireValue.medicanes ?? []]));
    });
  }
}
