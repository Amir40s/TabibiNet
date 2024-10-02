import 'dart:convert';
import 'dart:developer';
import 'package:tabibinet_project/model/api_services/api_services.dart';
import 'package:tabibinet_project/model/api_services/url/baseurl.dart';
import 'package:tabibinet_project/model/services/SharedPreference/shared_preference.dart';

class TranslationService {
  final String _apiKey = BaseUrl.API_KEY;

  Future<Map<String, String>> translateMultiple(List<String> texts) async {
    final pref = await SharedPreferencesService.getInstance();
    String language = pref.getString("language") ?? "en";

    try {
      final String url = '${BaseUrl.BASEURL_TRANSLATOR}$language&key=$_apiKey';

      final body = {
        'q': texts,
      };

      final response = await ApiService.post(
          requestBody: body, headers: BaseUrl.headers, endPoint: url);
      log("STATUS CODE:: ${response.statusCode}");
      log("BODY:: ${response.body}");

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        List<dynamic> translations = decodedResponse['data']['translations'];

        // Return the translated texts as a map
        return {
          for (int i = 0; i < texts.length; i++)
            texts[i]: translations[i]['translatedText'] ?? texts[i]
        };
      } else {
        return {
          for (var text in texts) text: 'Translation failed',
        };
      }
    } catch (e) {
      log("Error in translateMultiple: $e");
      return {
        for (var text in texts) text: 'Error in translation',
      };
    }
  }
}
