import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer; //final variable that is pointer to function that accept string as argument and return void 

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
} 


class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);  //"widget" is used to hold on property that belongs to the widget class inside of state class as 'onSelectAnswer' is available in QuestionsScreen widget class but we need it in state class
    setState(() {
      currentQuestionIndex++;
    });
  } //accepts the selected answer and passes to choosenAnswer list
  

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //use as much width as it can 
      child: Container(
        margin: const EdgeInsets.all(40), //margin from all direction
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //main axix in column is vertical axix
          crossAxisAlignment: CrossAxisAlignment.stretch, //horizontal axix
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 235, 165, 236),
                fontSize: 24, 
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answers){ 
                                                     //we needed to convert string type 'answer' to widget type because column only accepts widget type as children
                                                     //List of answer is of String type so new type ko answers should be of type string
                                                     //"Shuffle"- unlike map it does change the original list
              return AnswerButton(
                answerText: answers, 
                onTap: (){answerQuestion(answers);  //executed when button is tapped
                //it passes the selected answer to choosenAnswer list via different functions, where selected answer is stored to display it  
                                                    //way to pass function that doesnt return void to the argument that require void function
                });  //new items should be based on old items
            }), // to convert strings to widget
                                    //list can have broad variety of built in functions that can be called on them which interact in different ways
                                    //'map' allows to transform the values in a list to other values
                                      //'map' takes functions as values and will be executed automatically by dart for every list item and then dart also automatically pass the list item for which it is currently executing this function as an argument to this function
                                    //map yields new list object in memory and both lists coexist in memory ie map doesn't change the original list instead it returns a new list full of new objects
            ],
        ),
      ),
    );
  }
  }
