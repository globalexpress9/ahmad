

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';
import 'package:web/screens/HomeWeb/Home.dart';
import 'package:web/screens/web/login.dart';
import 'package:web/screens/web/register.dart';
import 'package:web/screens/web/steps/stepFive.dart';
import 'package:web/screens/web/steps/stepFour.dart';
import 'package:web/screens/web/steps/stepOne.dart';
import 'package:web/screens/web/steps/stepThird.dart';
import 'package:web/screens/web/steps/stepTwo.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';




String NAMEUSER = "";
String EMAILUSER = "";
String PASSWORDUSER = "";
final client =  SupabaseClient("https://ptjorxrhjzhxbzsafdcs.supabase.co", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB0am9yeHJoanpoeGJ6c2FmZGNzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njk3MTc3NzksImV4cCI6MTk4NTI5Mzc3OX0.p4a-dsh0GoNfZIp9DVvGtLrLPnls90bcl64QB3V15Wo");


void main() async{

  WebView.platform = WebWebViewPlatform();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 NAMEUSER = sharedPreferences.getString("NAMEUSER") ?? "";
 EMAILUSER = sharedPreferences.getString("EMAILUSER") ?? "";
 PASSWORDUSER = sharedPreferences.getString("PASSWORDUSER") ?? "";


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home:    const HomePageWeb(),
      routes: {
        'login' : (context) =>  const Login(),
        'register' : (context) =>  const Register(),
        'HomePageWeb' : (context) =>   const HomePageWeb(),
        'StepOne' : (context) => const  StepOne(),
        'StepTwo' : (context) => const  StepTwo(),
        'StepThird' : (context) => const  StepThird(),
        'StepFour' : (context) => const StepFour(),
        'StepFive' : (context) => const StepFive(),
      },
    );
  }
}
