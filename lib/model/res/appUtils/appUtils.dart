import 'package:provider/provider.dart';
import 'package:tabibinet_project/Providers/chatProvider/chatProvider.dart';
import 'package:tabibinet_project/global_provider.dart';

class AppUtils{
  final provider = GlobalProviderAccess.doctorProfilePro;
  String? getCurrentUserEmail(){

      String email = provider!.doctorEmail;
      return email;
  }

}