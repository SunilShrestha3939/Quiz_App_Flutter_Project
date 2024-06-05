import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:adv_basics/quiz.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.choosenAnswer, required this.resetScreen});
  final List<String> choosenAnswer;
  final void Function() resetScreen;

  List<Map<String, Object>> getSummeryData(){
    final List<Map<String, Object>> summary = [];

    for(var i=0; i<choosenAnswer.length; i++){
      summary.add(
        {
          'question_index' : i,
          'question' : questions[i].text,
          'correct_answer' : questions[i].answers[0],
          'user_answer' : choosenAnswer[i]
        },
      );
    }
    return summary; 
  }

  // List<Map<String, Object>>  get summeryData{        
  //   final List<Map<String, Object>> summary = [];

  //   for(var i=0; i<choosenAnswer.length; i++){
  //     summary.add(
  //       {
  //         'question_index' : i,
  //         'question' : questions[i].text,
  //         'correct_answer' : questions[i].answers[0],
  //         'user_answer' : choosenAnswer[i]
  //       },
  //     );
  //   }
  //   return summary; 
  // }
                                      //getter function is used if we have a function that doesnt take any input, no parameter and produce some data based on other class properties
                                      //remove the parenthesis and add "get" keyword
                                      //have body like function but called like variable--ie just summeryData


  @override
  Widget build(context){
    final summeryData = getSummeryData();   
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summeryData.where((data){
      return data['user_answer'] == data['correct_answer']; //returns true if condition is true and will be added to new list
                                //(data) => data['user_answer'] == data['correct_answer'],  //used when simple anonymous function which take input values immediately returns performs no other operations inside of the function body
                                //only have return statement inside function body
    }).length;  //.length as we want no of right answers  
                                //where is buildin function provided by dart which takes function as argument and will be executed for every item in list
                                //and receive that item as argument in that func which we passed to where
                                //it doesnt change the original list but it returns new list/iterable
                                //return TRUE if we want to keep that data point in that new filtered list that is returned by where of FALSE if it should be dropped

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answered $numCorrectQuestions out of $numTotalQuestions correctly!!!',
             style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 242, 245, 244),
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                  ),),
            const SizedBox(height: 30,),
            QuestionsSummery(summeryData), //here function wants list type argument and getSummeryData() function returns list 
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: resetScreen, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                backgroundColor: const Color.fromARGB(255, 2, 85, 219),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              ),
              child:  Text('Reset Quiz!',
              style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 243, 245, 245),
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                  ),
               ), 
              )
          ],
          ),
      ),
    );

  }
}