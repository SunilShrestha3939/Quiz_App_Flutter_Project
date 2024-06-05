import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      this.startQuiz, //accept pointer to switchScreen() func that can be used in current function
      {super.key}); //accept named key and forward it to super class

  final void Function() startQuiz;  //passed argument cannot be directly used inside build function so using 'this.startQuiz' and making final variable which keeps pointer to function which returns void 

  @override //to tell that we are overriding the method expected by stateless widget
  Widget build(context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, //takes only minimal vertical space as in default it takes all available vertical space
        
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 260,
            color: const Color.fromARGB(148, 248, 247, 246),// only available in asset constructor
            ), //constructor function to call image stored in local folder
          
          const SizedBox(height: 80),//for extra space
          
          Text(
            'Learn Flutter the fun way!!!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
            ),
          ),  
          
          const SizedBox(height: 30),
          
          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 2, 85, 219),
            ),
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            label: const Text('Start Quizz'),
          ),
      ],
      ),
    );
  } //StatelessWidget want us to implement build method
}

//it is start screen which contains img, text, and button which on pressing changes activeScreen variable to QuestionsScreen