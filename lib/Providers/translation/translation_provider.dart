import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabibinet_project/model/api_services/api_services.dart';
import 'package:tabibinet_project/model/api_services/url/baseurl.dart';
import 'package:tabibinet_project/model/services/SharedPreference/shared_preference.dart';

class TranslationProvider with ChangeNotifier {
  String _translatedText = "";
  String _currentLanguage = "ar";
  Map<String, String> _translatedTexts = {};

  String get translatedText => _translatedText;
  String get currentLanguage => _currentLanguage;
  Map<String, String> get translatedTexts => _translatedTexts;

  final String _apiKey = BaseUrl.API_KEY;

  final Map<String, String> _languages = {
    'English': 'en',
    'Arabic': 'ar',
    'French': 'fr',
    'Spanish': 'es',
  };

  Map<String, String> get languages => _languages;

  void changeLanguage(String language) {
    _currentLanguage = _languages[language] ?? 'en';
    notifyListeners();
  }

  Future<void> translateSingleText(String text) async {
    final String url =
        'https://translation.googleapis.com/language/translate/v2?target=$_currentLanguage&key=$_apiKey&q=${Uri.encodeComponent(text)}';
    final response = await ApiService.get(
        endPoint: url,
        headers: BaseUrl.headers
    );
    log("STATUS CODE:: ${response.statusCode}");
    log("BODY:: ${response.body}");
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      _translatedText = decodedResponse['data']['translations'][0]['translatedText'];
      log("TRANSLATE:: ${_translatedText}");
    } else {
      _translatedText = 'Translation failed';
    }
    notifyListeners();
  }


  Future<void> translateMultiple(List<String> texts) async {

    final pref = await SharedPreferencesService.getInstance();

    String language = pref.getString("language") ?? "en";

    try{
      final String url =
          '${BaseUrl.BASEURL_TRANSLATOR}$language&key=$_apiKey';

      final body = {
        'q': texts,
      };

      final response = await ApiService.post(
          requestBody: body,
          headers: BaseUrl.headers,
          endPoint: url
      );
      log("STATUS CODE:: ${response.statusCode}");
      log("BODY:: ${response.body}");
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        List<dynamic> translations = decodedResponse['data']['translations'];

        // Store the translated texts in the map
        _translatedTexts = {
          for (int i = 0; i < texts.length; i++)
            texts[i]: translations[i]['translatedText'] ?? texts[i]
        };
        log("TRANSLATE MULTIPLE:: ${_translatedTexts}");
      } else {
        _translatedTexts = {
          for (var text in texts) text: 'Translation failed',
        };
      }
    }catch (e){
      log("Error in translateMultiple: $e");
      return;
    }


    notifyListeners();
  }
}
