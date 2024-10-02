import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class TwilioService {
  final String accountSid;
  final String authToken;
  final String twilioPhoneNumber;

  TwilioService({
    required this.accountSid,
    required this.authToken,
    required this.twilioPhoneNumber,
  });

  Future<void> sendSmsReminder(String toPhoneNumber, String message) async {
    final String url = 'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';
    final String credentials = '$accountSid:$authToken';
    final String encodedCredentials = base64Encode(utf8.encode(credentials));

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic $encodedCredentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'From': twilioPhoneNumber,
        'To': toPhoneNumber,
        'Body': message,
      },
    );

    if (response.statusCode == 201) {
      log('SMS sent successfully');
    } else {
      throw Exception('Failed to send SMS: ${response.statusCode} ${response.body}');
    }
  }
}
