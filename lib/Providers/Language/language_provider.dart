import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../model/services/SharedPreference/shared_preference.dart';

class LanguageProvider extends ChangeNotifier {

  final  SharedPreferencesService _sharedPreferenceService = SharedPreferencesService();

  int _selectedIndex = 2; // Default selection
  bool _isBouncing = false;
  Map<String, String> _localizedStrings = {};
  String _selectedLanguage = 'en';
  static const String languageKey = 'selected_language';
  static const String languageIndex = 'selected_language_index';


  int get selectedIndex => _selectedIndex;
  bool get isBouncing => _isBouncing;
  String get selectedLanguage => _selectedLanguage;
  Map<String, String> get localizedStrings => _localizedStrings;


  // Fetch translation for a specific key
  String translate(String key) {
    return _localizedStrings[key] ?? key; // Return key if translation not found
  }

  Future<void> loadLanguage(String languageCode) async {
    _selectedLanguage = languageCode;
    String jsonString = await rootBundle.loadString('assets/translations/$languageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));

    // Save selected language to SharedPreferences
    await _sharedPreferenceService.setString(languageKey, languageCode);

    log(_selectedLanguage);
    log(_selectedIndex.toString());
    notifyListeners();
  }

  // Load the saved language on app start
  Future<void> loadSavedLanguage() async {
    String? savedLanguage = await _sharedPreferenceService.getString(languageKey);
    int? savedIndex = await _sharedPreferenceService.getInt(languageIndex);

    // If no language is saved, default to English
    if (savedLanguage != null) {
      await loadLanguage(savedLanguage);
      _selectedIndex = savedIndex ?? 3;
      log(savedIndex.toString());
      log(savedLanguage);
      notifyListeners();
    } else {
      await loadLanguage('en');
    }
  }

  Future<void> selectButton(int index) async {
    _selectedIndex = index;
    await _sharedPreferenceService.setInt(languageIndex, _selectedIndex);
    _isBouncing = true;
    notifyListeners();
  }

}