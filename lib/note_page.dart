import 'package:fire_auth_serv/data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  final name = TextEditingController();
  final description = TextEditingController();

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      // print('object');
                      logout(context);
                    },
                    child: const Text('Logout')),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Name",
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: description,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Description",
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      // print('object');
                      DataService().createItem(name.text, description.text);
                    },
                    child: const Text('Add')),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      // print('object');
                      DataService().readItems();
                    },
                    child: const Text('Read')),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber[colorCodes[index]],
                        child: Center(child: Text('Entry ${entries[index]}')),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
