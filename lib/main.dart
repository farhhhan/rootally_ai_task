

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rootaly_task/application/assesment_bloc/bloc/assesment_bloc.dart';
import 'package:rootaly_task/application/bloc_index/bloc/index_bloc.dart';
import 'package:rootaly_task/firebase_options.dart';
import 'package:rootaly_task/presentation/home/home_screen.dart';
import 'package:rootaly_task/utils/color_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorThemes.appTitleColor(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: ColorThemes.appTitleColor(),
          secondary: ColorThemes.lightGreen(),
        ),
        scaffoldBackgroundColor: ColorThemes.lightWhite(),
        textTheme: TextTheme(
      
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorThemes.appTitleColor(),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IndexBloc(),
          ),
          BlocProvider(
            create: (context) => AssesmentBloc(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
