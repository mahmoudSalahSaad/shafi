// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `please enter a valid email`
  String get valid_email {
    return Intl.message(
      'please enter a valid email',
      name: 'valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our integrated medical application.`
  String get welcome_text {
    return Intl.message(
      'Welcome to our integrated medical application.',
      name: 'welcome_text',
      desc: '',
      args: [],
    );
  }

  /// `SHAFI`
  String get shafi {
    return Intl.message(
      'SHAFI',
      name: 'shafi',
      desc: '',
      args: [],
    );
  }

  /// `The phone number consists of 20 digits.`
  String get phone_limit_message {
    return Intl.message(
      'The phone number consists of 20 digits.',
      name: 'phone_limit_message',
      desc: '',
      args: [],
    );
  }

  /// `The phone number field is required.`
  String get phone_field_required {
    return Intl.message(
      'The phone number field is required.',
      name: 'phone_field_required',
      desc: '',
      args: [],
    );
  }

  /// `The password field is required.`
  String get password_field_required {
    return Intl.message(
      'The password field is required.',
      name: 'password_field_required',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password_question {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password_question',
      desc: '',
      args: [],
    );
  }

  /// `The field is required.`
  String get field_required {
    return Intl.message(
      'The field is required.',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `The confirm password field is required.`
  String get confirm_password_field_required {
    return Intl.message(
      'The confirm password field is required.',
      name: 'confirm_password_field_required',
      desc: '',
      args: [],
    );
  }

  /// `The confirm password does not match.`
  String get confirm_password_not_match {
    return Intl.message(
      'The confirm password does not match.',
      name: 'confirm_password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the OTP sent to your phone number.`
  String get otp_message {
    return Intl.message(
      'Please enter the OTP sent to your phone number.',
      name: 'otp_message',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the OTP?`
  String get didnt_recive_otp {
    return Intl.message(
      'Didn\'t receive the OTP?',
      name: 'didnt_recive_otp',
      desc: '',
      args: [],
    );
  }

  /// `Ask Again`
  String get ask_again {
    return Intl.message(
      'Ask Again',
      name: 'ask_again',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `My Health`
  String get my_health {
    return Intl.message(
      'My Health',
      name: 'my_health',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get personal {
    return Intl.message(
      'Personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Book your appointment`
  String get ask_for_apointment {
    return Intl.message(
      'Book your appointment',
      name: 'ask_for_apointment',
      desc: '',
      args: [],
    );
  }

  /// `Your last appointments`
  String get your_last_apointments {
    return Intl.message(
      'Your last appointments',
      name: 'your_last_apointments',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `My Appointments`
  String get my_apointments {
    return Intl.message(
      'My Appointments',
      name: 'my_apointments',
      desc: '',
      args: [],
    );
  }

  /// `My Medicines`
  String get my_medicines {
    return Intl.message(
      'My Medicines',
      name: 'my_medicines',
      desc: '',
      args: [],
    );
  }

  /// `My Treatment Plans`
  String get my_treatment_plans {
    return Intl.message(
      'My Treatment Plans',
      name: 'my_treatment_plans',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get delete_account_message {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'delete_account_message',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `German`
  String get de {
    return Intl.message(
      'German',
      name: 'de',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get fr {
    return Intl.message(
      'French',
      name: 'fr',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get es {
    return Intl.message(
      'Spanish',
      name: 'es',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get ru {
    return Intl.message(
      'Russian',
      name: 'ru',
      desc: '',
      args: [],
    );
  }

  /// `Available Times`
  String get available_times {
    return Intl.message(
      'Available Times',
      name: 'available_times',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get book_now {
    return Intl.message(
      'Book Now',
      name: 'book_now',
      desc: '',
      args: [],
    );
  }

  /// `Apointment Date`
  String get apointment_date {
    return Intl.message(
      'Apointment Date',
      name: 'apointment_date',
      desc: '',
      args: [],
    );
  }

  /// `Apointment Time`
  String get apointment_time {
    return Intl.message(
      'Apointment Time',
      name: 'apointment_time',
      desc: '',
      args: [],
    );
  }

  /// `Apointment Reason`
  String get apointment_reason {
    return Intl.message(
      'Apointment Reason',
      name: 'apointment_reason',
      desc: '',
      args: [],
    );
  }

  /// `The apointment reason field is required.`
  String get apointment_reason_field_required {
    return Intl.message(
      'The apointment reason field is required.',
      name: 'apointment_reason_field_required',
      desc: '',
      args: [],
    );
  }

  /// `The apointment date field is required.`
  String get apointment_date_field_required {
    return Intl.message(
      'The apointment date field is required.',
      name: 'apointment_date_field_required',
      desc: '',
      args: [],
    );
  }

  /// `The apointment time field is required.`
  String get apointment_time_field_required {
    return Intl.message(
      'The apointment time field is required.',
      name: 'apointment_time_field_required',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Please select category`
  String get please_select_category {
    return Intl.message(
      'Please select category',
      name: 'please_select_category',
      desc: '',
      args: [],
    );
  }

  /// `Sub Category`
  String get sub_category {
    return Intl.message(
      'Sub Category',
      name: 'sub_category',
      desc: '',
      args: [],
    );
  }

  /// `Please select sub category`
  String get please_select_sub_category {
    return Intl.message(
      'Please select sub category',
      name: 'please_select_sub_category',
      desc: '',
      args: [],
    );
  }

  /// `Go To Summary`
  String get go_to_summary {
    return Intl.message(
      'Go To Summary',
      name: 'go_to_summary',
      desc: '',
      args: [],
    );
  }

  /// `Answer The Questions`
  String get answer_the_questions {
    return Intl.message(
      'Answer The Questions',
      name: 'answer_the_questions',
      desc: '',
      args: [],
    );
  }

  /// `Apointment Summary`
  String get apointment_summary {
    return Intl.message(
      'Apointment Summary',
      name: 'apointment_summary',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Appointment`
  String get confirm_appointment {
    return Intl.message(
      'Confirm Appointment',
      name: 'confirm_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name`
  String get patient_name {
    return Intl.message(
      'Patient Name',
      name: 'patient_name',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Name`
  String get doctor_name {
    return Intl.message(
      'Doctor Name',
      name: 'doctor_name',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Apointment Details`
  String get apointment_details {
    return Intl.message(
      'Apointment Details',
      name: 'apointment_details',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait...`
  String get please_wait {
    return Intl.message(
      'Please Wait...',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `Add New Medicine`
  String get add_new_medicine {
    return Intl.message(
      'Add New Medicine',
      name: 'add_new_medicine',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Name`
  String get medicine_name {
    return Intl.message(
      'Medicine Name',
      name: 'medicine_name',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Description`
  String get medicine_description {
    return Intl.message(
      'Medicine Description',
      name: 'medicine_description',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get delete_message {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'delete_message',
      desc: '',
      args: [],
    );
  }

  /// `ssssss`
  String get ssssss {
    return Intl.message(
      'ssssss',
      name: 'ssssss',
      desc: '',
      args: [],
    );
  }

  /// `Enter SSN`
  String get enter_ssn {
    return Intl.message(
      'Enter SSN',
      name: 'enter_ssn',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid SSN`
  String get valid_ssn {
    return Intl.message(
      'Please enter a valid SSN',
      name: 'valid_ssn',
      desc: '',
      args: [],
    );
  }

  /// `Treatment Plan`
  String get treatment_plan {
    return Intl.message(
      'Treatment Plan',
      name: 'treatment_plan',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'sv'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
