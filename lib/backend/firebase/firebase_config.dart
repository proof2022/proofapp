import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBR_zwkPeXQaOfeNSxqwCEH5T8He8-vjjc",
            authDomain: "proofbe-48949.firebaseapp.com",
            projectId: "proofbe-48949",
            storageBucket: "proofbe-48949.appspot.com",
            messagingSenderId: "55167924775",
            appId: "1:55167924775:web:da802327d29d49cc3b6c02"));
  } else {
    await Firebase.initializeApp();
  }
}
