import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
   const AnswerButton({required this.answerText, required this.onTap, super.key});  //on adding required it can be used as positional argument

  final String answerText;  //property
  final void Function() onTap;  //accepts function type which return void

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onTap, 
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 2, 85, 219),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          child: Text(answerText, textAlign: TextAlign.center,),
          );
  }
} 