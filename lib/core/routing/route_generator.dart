import 'package:flutter/material.dart';
import 'package:shafi/bottom_navigation_bar_screen.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/apointment_summary_screen.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/apointment_times_screen.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/category_screen.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/doctors_list_screen.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/my_apointment_screens.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/questions_screen.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/sub_category_screen.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/screens/forget_password_screen.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/screens/otp_screen.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/screens/reset_password_screen.dart';
import 'package:shafi/features/auth_feature/presentation/login/screens/login_screen.dart';
import 'package:shafi/features/auth_feature/presentation/register/screens/register_screen.dart';
import 'package:shafi/features/home_feature/presentation/widgets/home_screen.dart';
import 'package:shafi/features/my_medicens/peresentaion/screens/medical_history_screen.dart';
import 'package:shafi/features/my_medicens/peresentaion/screens/treatments_plans_screen.dart';
import 'package:shafi/features/privacy/presentation/pages/privacy_screen.dart';
import 'package:shafi/features/splash_feature/presentation/screens/splash_screen.dart';
import 'package:shafi/features/vedio_call/video_call_screen.dart';

// import 'package:shafi/features/auth_feature/screen/login_screen.dart';
// import 'package:shafi/features/home_screen/persentation/screens/choose_project_screen.dart';
// import 'package:shafi/features/home_screen/persentation/screens/home_screen.dart';
// import 'package:shafi/features/home_screen/persentation/screens/leave_pick_image_screen.dart';
// import 'package:shafi/features/home_screen/persentation/screens/pic_image_screen.dart';
// import 'package:flutter/material.dart';

// import '../../features/splash_screen/splac_screen.dart';
import 'platform_page_route.dart';
import 'undefined_route_screen.dart';

class RouteGenerator {
  static Route generateBaseRoute(RouteSettings settings) {
    return getRoute(settings);
  }

  static Route getRoute(RouteSettings settings) {
    if (settings.name == Routes.init) {
      return platformPageRoute(const SplashScreen());
    }

    if (settings.name == Routes.bottomNavigationBarScreen) {
      return platformPageRoute(const BottomNavigationBarScreen());
    }

    if (settings.name == Routes.login) {
      return platformPageRoute(const LoginScreen());
    }
    if (settings.name == Routes.register) {
      return platformPageRoute(const RegisterScreen());
    }
    if (settings.name == Routes.forgetPassword) {
      return platformPageRoute(const ForgetPasswordScreen());
    }
    if (settings.name == Routes.otpPassword) {
      return platformPageRoute(const OtpScreen());
    }
    if (settings.name == Routes.resetPassword) {
      return platformPageRoute(const ResetPasswordScreen());
    }
    if (settings.name == Routes.home) {
      return platformPageRoute(const HomeScreen());
    }
    if (settings.name == Routes.doctorListScreen) {
      return platformPageRoute(const DoctorsListScreen());
    }
    if (settings.name == Routes.categoryScreen) {
      return platformPageRoute(const CategoryScreen());
    }
    if (settings.name == Routes.apointmentTimesScreen) {
      return platformPageRoute(const ApointmentTimesScreen());
    }
    if (settings.name == Routes.subCategoryScreen) {
      return platformPageRoute(const SubCategoryScreen());
    }
    if (settings.name == Routes.questionsScreen) {
      return platformPageRoute(const QuestionsScreen());
    }
    if (settings.name == Routes.apointmentSummaryScreen) {
      return platformPageRoute(const ApointmentSummaryScreen());
    }
    if (settings.name == Routes.myApointmentScreen) {
      return platformPageRoute(const MyApointmentScreen());
    }
    if (settings.name == Routes.videoCallScreen) {
      final args = settings.arguments as Map<String, dynamic>;
      return platformPageRoute(VideoCallScreen(
        apointmentModel: args['apointmentModel'],
      ));
    }
    if (settings.name == Routes.medicalHestoryScreen) {
      return platformPageRoute(const MedicalHistoryScreen());
    }
    if (settings.name == Routes.treatmentPlansScreen) {
      return platformPageRoute(const TreatmentsPlansScreen());
    }
    if (settings.name == Routes.privacyScreen) {
      return platformPageRoute(const PrivacyScreen());
    }
    // if (settings.name == Routes.startWorkScreen) {
    //   return platformPageRoute(const StartWorkScreen());
    // } else if (settings.name == Routes.chooseProjectScreen) {
    //   return platformPageRoute(const ChooseProjectScreen());
    // } else if (settings.name == Routes.pickImageScreen) {
    //   return platformPageRoute(const PickImageScreen());
    // } else if (settings.name == Routes.leavePickImageScreen) {
    //   return platformPageRoute(const LeavePickImageScreen());
    // } else {
    //   return platformPageRoute(UndefinedRouteScreen(settings.name));
    // }
    return platformPageRoute(UndefinedRouteScreen(settings.name));
  }
}
