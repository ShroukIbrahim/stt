

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stt/Pages/SpeechToTextPage/STTCubit/speechtotext_cubit.dart';

import 'Pages/SpeechToTextPage/speechtotextpage.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeechtotextCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SpeechToTextPage()


      ),
    );
  }

}



