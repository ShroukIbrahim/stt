import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stt/utils/Constantes/permissions.dart';
part 'speechtotext_state.dart';


class SpeechtotextCubit extends Cubit<SpeechtotextState> {

  final TextEditingController textController = TextEditingController();
  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = "";

  SpeechtotextCubit() : super(SpeechtotextLoading());


  void initSpeech() async {
    AppPermissions.microphonePermissions();
    speechEnabled = await speechToText.initialize();
    emit(SpeechtotextLoading());
  }
  void startListening() async {
    await speechToText.listen(
      onResult: onSpeechResult,
      listenFor: const Duration(seconds: 60),
      localeId: "ar-EG",
      cancelOnError: false,
      partialResults: false,
      listenMode: ListenMode.confirmation,
    );
    emit(SpeechtotextStart());

  }
  void stopListening() async {
    await speechToText.stop();
   emit(SpeechtotextStop());
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    lastWords = "$lastWords${result.recognizedWords} ";
    textController.text = lastWords;
  }
  
}
