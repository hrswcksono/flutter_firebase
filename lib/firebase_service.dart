import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  // static final FirebaseService _instance = FirebaseService._();

  // factory FirebaseService() => _instance;

  // FirebaseService._();

  // Future<void> initialize() async {
  //   await Firebase.initializeApp();
  // }

  Future<void> initialize() async {
    FirebaseDatabase.instance;
  }

  DatabaseReference get databaseRef => FirebaseDatabase.instance.reference();
  // DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
}
