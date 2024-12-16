import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shafi/core/services/local/cache_consumer.dart';
import 'package:shafi/core/services/network/network_client.dart';
import 'package:shafi/data/datasource/remote/dio/dio_client.dart';
import 'package:shafi/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:shafi/features/apointment_feature/data/repository_implementaion/apointments_repository_implemention.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/booking_submetion_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_booking_avalibale_times_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_categories_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_doctors_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_question_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/get_sub_category_use_case.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/video_call_request_use_case.dart';
import 'package:shafi/features/auth_feature/data/repositoey_implementation/auth_reopsitory_implementation.dart';
import 'package:shafi/features/auth_feature/domain/repository/auth_repository.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/login_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/refresh_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/register_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/resend_code_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/verify_phone_use_case.dart';
import 'package:shafi/features/home_feature/data/rempository_implementation/home_repository_implemention.dart';
import 'package:shafi/features/home_feature/domain/repository/home_repository.dart';
import 'package:shafi/features/home_feature/domain/use_cases/get_apointment_dates_use_case.dart';
import 'package:shafi/features/home_feature/domain/use_cases/get_apointments_use_case.dart';
import 'package:shafi/features/my_medicens/data/repository_implemention/repository_implemention.dart';
import 'package:shafi/features/my_medicens/domain/repository/repository.dart';
import 'package:shafi/features/my_medicens/domain/use_cases/add_medicane_use_case.dart';
import 'package:shafi/features/my_medicens/domain/use_cases/get_medical_history_use_case.dart';
import 'package:shafi/features/my_medicens/domain/use_cases/get_treatment_plans_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /*
  * >USECASES<
  *
  *
  * */

  getIt.registerLazySingleton(
      () => LoginUseCase(authRefreshRepository: getIt()));
  getIt.registerLazySingleton(
      () => RegisterUseCase(authRefreshRepository: getIt()));
  getIt.registerLazySingleton(
      () => RefreshUseCase(authRefreshRepository: getIt()));
  getIt.registerLazySingleton(
      () => VerifyPhoneUseCase(authRefreshRepository: getIt()));
  getIt.registerLazySingleton(
      () => ResendCodeUseCase(authRefreshRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetApointmentsUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(
      () => BookingSubmetionUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetBookingAvalibaleTimesUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetCategoriesUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetDoctorsUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetQuestionUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => VideoCallRequestUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetSubCategoryUseCase(apointmentRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetApointmentDatesUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetMedicalHistoryUseCase(medicalRepository: getIt()));
  getIt.registerLazySingleton(
      () => AddMedicaneUseCase(medicalRepository: getIt()));
  getIt.registerLazySingleton(
      () => GetTreatmentPlansUseCase(medicalRepository: getIt()));
  // getIt.registerLazySingleton(() => ProjectsUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => ShiftsUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => CheckInUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => LeavingReasonUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => CheckOutUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => GetAttendanceUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => GetReplacemntAttendanceUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => ReplacementCheckOutUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(() => ReplacemntCheckinUseCase(homeRepo: getIt()));
  // getIt.registerLazySingleton(
  //     () => AuthRefreshUseCase(authRefreshRepository: getIt()));
  /*
  * Cubits
  * */
  // getIt.registerLazySingleton(() => HomeCubit(homeUseCase: getIt())) ;

  /// Core
  getIt.registerLazySingleton(() => DioClient(
      "https://manage.shafi.app/api/v1/", getIt(),
      loggingInterceptor: getIt(), cacheConsumer: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => NetworkClient());
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(
      () => AppPrefs(secureStorage: getIt(), sharedPreferences: getIt()));
  //
  // getIt.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));
  // getIt.registerLazySingleton(() => ApiConsumer(getIt<Dio>(), getIt<PrettyDioLogger>(), getIt()));
  /*
  * Repository */
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthReopsitoryImplementation(networkClient: getIt()));
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplemention(networkClient: getIt()));
  getIt.registerLazySingleton<ApointmentRepository>(
      () => ApointmentsRepositoryImplemention(networkClient: getIt()));
  getIt.registerLazySingleton<MedicalRepository>(
      () => MedicaneRepositoryImplemention(networkClient: getIt()));
  // getIt.registerLazySingleton<HomeRepository>(
  //     () => HomeRepositoryImplmentaion(networkClient: getIt()));
  // getIt.registerLazySingleton<AuthRefreshRepository>(
  //     () => AuthRefreshRepositoryImpl(networkClient: getIt()));
}
