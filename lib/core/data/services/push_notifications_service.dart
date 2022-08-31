// SHA1:9D:EB:CD:9B:EE:56:98:B4:C4:8D:27:57:F3:D4:27:0A:FC:85:D5:7E
// SHA256: A1:76:4B:83:9E:A6:8F:6E:FC:16:4D:EC:93:A6:BC:94:DF:6A:52:3C:14:DC:5D:7E:EE:FB:F7:BD:0B:2A:B3:6D
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static Future <String?> initalizedApp() async{

    try {

      // PUSH NOTIFICATIONS
      await Firebase.initializeApp();
      token = await FirebaseMessaging.instance.getToken();

    } catch (e) {

      print(e);

    }

    return token;

  }


}