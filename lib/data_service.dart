import 'package:fire_auth_serv/firebase_service.dart';
import 'package:firebase_database/firebase_database.dart';

class DataService {
  final DatabaseReference _dbRef = FirebaseService().databaseRef.child('items');

  Future<void> createItem(String name, String description) async {
    // final newItemRef = _dbRef.push();
    // await newItemRef.set({
    //   'name': name,
    //   'description': description,
    // });
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

    await ref.set({
      "name": "John",
      "age": 18,
      "address": {"line1": "100 Mountain View"}
    });
  }

  Future<dynamic> readItems() async {
    final snapshot = await _dbRef.child('users/123').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
    // final event = await _dbRef.once(DatabaseEventType.value);
    // final data = event.snapshot.value;
    // print(data);
    // return data;
  }

  Future<void> updateItem(
      String itemId, String newName, String newDescription) async {
    final itemRef = _dbRef.child(itemId);
    await itemRef.update({
      'name': newName,
      'description': newDescription,
    });
  }

  Future<void> deleteItem(String itemId) async {
    final itemRef = _dbRef.child(itemId);
    await itemRef.remove();
  }
}
