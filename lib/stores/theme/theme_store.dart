// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member, library_private_types_in_public_api, unnecessary_this

import 'package:car_master/data/repository.dart';
import 'package:car_master/stores/error/error_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final String TAG = "_ThemeStore";

  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  bool _darkMode = false;


  // getters:-------------------------------------------------------------------
  bool get darkMode => _darkMode;

  // constructor:---------------------------------------------------------------
  _ThemeStore(Repository repository)
      : this._repository = repository {
    init();
  }

  // actions:-------------------------------------------------------------------
  @action
  Future changeBrightnessToDark(bool value) async {
    _darkMode = value;
    await _repository.changeBrightnessToDark(value);
  }

  // general methods:-----------------------------------------------------------
  Future init() async {
    _darkMode = _repository.isDarkMode;
  }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {

  }
}
