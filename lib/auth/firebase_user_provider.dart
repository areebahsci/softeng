import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SportsManagementAppFirebaseUser {
  SportsManagementAppFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

SportsManagementAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SportsManagementAppFirebaseUser>
    sportsManagementAppFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SportsManagementAppFirebaseUser>(
            (user) => currentUser = SportsManagementAppFirebaseUser(user));
