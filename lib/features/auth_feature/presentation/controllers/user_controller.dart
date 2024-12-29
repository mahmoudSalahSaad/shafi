import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/services/local/cache_consumer.dart';
import 'package:shafi/core/services/local/storage_keys.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/refresh_use_case.dart';
import 'package:shafi/generated/l10n.dart';

part 'user_controller.freezed.dart';
part 'user_controller.g.dart';
part 'user_state.dart';

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override

  /// Initializes the user controller and loads the user from the local storage
  /// if available.
  ///
  /// Returns a future that completes with the initial state of the user
  /// controller.
  @override
  Future<UserState> build() async {
    // Initialize the state with an empty user state
    state = AsyncData(UserState());

    // Try to load the user from the local storage
    final cachedUser = await getIt<AppPrefs>().get(PrefKeys.user);

    // If the user is available in the local storage, update the state
    if (cachedUser != null) {
      final userModel = UserModel.fromJson(json.decode(cachedUser));
      state = AsyncData(state.requireValue.copyWith(user: userModel));
    }

    // Return the initial state
    return state.requireValue;
  }

  saveUser(UserModel user) async {
    AppPrefs appPrefs = getIt();
    await appPrefs.save(PrefKeys.user, json.encode(user.toJson()));
    await appPrefs.save(PrefKeys.token, user.authorization?.token);
    state = AsyncData(state.requireValue.copyWith(user: user));
  }

  Future<UserModel?> getUser() async {
    AppPrefs appPrefs = getIt();
    String? cachedUser = await appPrefs.get(PrefKeys.user);

    if (cachedUser != null) {
      UserModel userModel = UserModel.fromJson(
        json.decode(cachedUser),
      );
      state = AsyncData(
        state.requireValue.copyWith(user: userModel),
      );
      print("fghjkpl===>${state.requireValue.user}");
      return userModel;
    } else {
      state = AsyncData(
        state.requireValue.copyWith(user: null),
      );
      return null;
    }
  }

  clearUser() async {
    AppPrefs appPrefs = getIt();
    await appPrefs.delete(PrefKeys.user);
    await appPrefs.delete(PrefKeys.token);
    state = AsyncData(
      state.requireValue.copyWith(user: null),
    );
  }

  refreshToken() async {
    RefreshUseCase refreshUseCase = getIt();
    AppPrefs appPrefs = getIt();
    final result = await refreshUseCase.call(NoParameters());
    result.fold((l) {}, (r) async {
      await appPrefs.save(PrefKeys.token, r.authorization?.token);
    });
  }

  setLocale(String locale) async {
    AppPrefs appPrefs = getIt();
    await appPrefs.save(PrefKeys.lang, locale);
    S.load(Locale(locale));
    state = AsyncData(state.requireValue.copyWith(locale: locale));
  }

  getLocale() async {
    AppPrefs appPrefs = getIt();
    String? locale = await appPrefs.get(PrefKeys.lang);
    return locale ?? 'ar';
  }
}
