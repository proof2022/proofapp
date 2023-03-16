import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ProofFirebaseUser {
  ProofFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ProofFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ProofFirebaseUser> proofFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ProofFirebaseUser>(
      (user) {
        currentUser = ProofFirebaseUser(user);
        return currentUser!;
      },
    );
