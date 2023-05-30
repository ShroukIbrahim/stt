
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_down_button/hold_down_button.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:stt/Pages/SpeechToTextPage/STTCubit/speechtotext_cubit.dart';
import '../../utils/Constantes/permissions.dart';




class SpeechToTextPage extends StatelessWidget {
  const SpeechToTextPage({super.key});



  @override
  Widget build(BuildContext context) {
    SpeechtotextCubit cubit= BlocProvider.of<SpeechtotextCubit>(context);
    return Scaffold(body:
        BlocBuilder<SpeechtotextCubit,SpeechtotextState>(builder: (context, state) {
          if (state is SpeechtotextLoading) {
            cubit.initSpeech();
            return Center(
              child:  Text(
                'Start Voise',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }

          else if (state is SpeechtotextStart){
            return Padding(
              padding: const EdgeInsets.only(top: 100.0,left: 10,right: 10,bottom: 50),
              child:  Container(
                decoration:  BoxDecoration(
                  border: Border.all(
                      color:  Colors.blue,
                      width: 2.0,
                      style: BorderStyle.solid), //Border.all
                  borderRadius:  const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),

                child: Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration:  const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                        )),
                    controller: cubit.textController,
                    minLines: 6,
                    maxLines: 20,


                  ),
                ),
              ),
            );}
          else if (state is SpeechtotextStop) {
            return Center(
              child:  Text(
                ' Voise Stop',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );

          }
          else {
            return Center(
            child:  Text(
              'No Voise',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          );
          }


    }),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: HoldDownButton(
        onHoldDown: () =>  cubit.startListening(),
        child:  AvatarGlow(
          animate: cubit.speechEnabled,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 75.0,
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: (){

              if(cubit.speechToText.isNotListening){
                cubit.startListening() ;

              }
              else{

                cubit.stopListening();
              }

            },

            child: Icon(cubit.speechToText.isNotListening ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),





    );

  }
  }

