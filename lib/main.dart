import 'package:course_correct/appstate/app_state.dart';
import 'package:course_correct/pages/appointments_page.dart';
import 'package:course_correct/pages/landing_page.dart';
import 'package:course_correct/pages/tutor_appointments.dart';
import 'package:course_correct/pages/tutor_students.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:course_correct/pages/profile_page.dart';
import 'package:course_correct/pages/test_page.dart';
import 'package:provider/provider.dart';


late AppState appState;
void main() async {
  appState = AppState();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => appState,
      child: MaterialApp(
        title: 'Course Correct',
        debugShowCheckedModeBanner: false,
        routes: {
          '/profilepage': (context) => const ProfilePage1(),
          '/landingpage': (context) => LandingPage(),
          '/appointments': (context) => TutorAppointments(),
          '/students': (context) => TutorStudents(),
          // ignore: equal_keys_in_map
          '/appointments': (context) => AppointmentsPage(),
          // '/settingspage': (context) => SettingsPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.cyan,
          ),
          textTheme: const TextTheme(
            headlineLarge:
                TextStyle(fontFamily: 'Schyler', fontWeight: FontWeight.bold),
          ),
        ),
        home: Builder(
            
            builder: (context) {
              appState.user = FirebaseAuth.instance.currentUser;
              return const TestPage();
            }),
      ),
    );
  }
}
