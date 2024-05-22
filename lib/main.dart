import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/views/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: FutureBuilder(
          future: _signInAnonymously(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const HomePage();
            }
          }),
      // home: CreateTodoTaskForm(),
    ),
  ));
}

Future<User> _signInAnonymously() async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInAnonymously();
  return userCredential.user!;
}
