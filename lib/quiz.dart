import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});  //constructor

  @override
  State<Quiz> createState() {
    return _QuizState();
  } //'createState' creates instance of a class thats based on State connected to 'Quiz' ie instance of 'QuizState' class
}

//MANAGED state
class _QuizState extends State<Quiz> {  //automatically creates constructor
  List<String> selectedAnswers = [];  //var type as it is initiallized  //to store the answers we have chosen/selected
  Widget? activeScreen;  //nullable variable 

  void choosenAnswer(String answer){  //function which accepts the chosen answer from "questions_screen.dart" and appends that data in selectedAnswer list variable
    selectedAnswers.add(answer);

    //to handle what comes after all the questions have been rendered ie after answering last
    if(selectedAnswers.length == questions.length){ //all questions have been answered
      setState(() {   //internal state of this object has changed in a way that might impact the user interface in this subtree
        activeScreen = ResultScreen(choosenAnswer: selectedAnswers, resetScreen: resetQuiz,); 
      });
    } //this will only work for 1 more round of question as after that the above condition will not be satisfied as selectedAnswers will be greater than question length so error will occure, so we have to reset the selectedAnswers list to empty list by changing it to "var" from "final" by simply removing final keyword as only variable can be initiallized 
  }

  void resetQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen); 
    });
  }

  //flutter execute "initState" function before "build" function
  @override
  void initState() {    //function provided by "State<Quiz>" 
                        //method that should be added in our state class to do some extra initialization work when that state object is created for the first time
                        //due to 'initState' function 'activeScreen' is not create and assigned StartScreen and QuestionScreen at the same time
    super.initState();  //allows parent class to execute "initState" as well to allow flutter to do its additional initialization work that might be performed in that parent class
    activeScreen = StartScreen(switchScreen);   //switchScreen is just pointer passed as argument. It doesn't mean that switchScreen is executed before StartScreen. Inside StartScreen when pointer of switchScreen is called it goes to the actual switchScreen() and executes 
                                                //activeScreen variable is initiallized to StartScreen only, ie it is just storing the data StartScreen such that if now activeScreen variable is called it points to StartScreen widget. "StartScreen has not been executed yet, just stored"
  }

//MANIPULATE state
  void switchScreen() {
    setState(() {   
    //  function provided by flutter available inside of classes 'extend State'
    //  inside this function we should perform any data changing activity which should be reflected in user interface
    //  setState execute the 'build' method
    //   When we call setState in a state class ie class connected to statefulWidget. Flutter will re-execute the build method ie run the code present in build method and then compare that result from executing that code to the result it got last time it executed the build method. And if there are any differences then it updates the rendered UI accordingly 
    //Calling setState notifies the framework that the internal state of this object has changed in a way that might impact the user interface in this subtree, which causes the framework to schedule a build for this State object.
    // If you just change the state directly without calling setState, the framework might not schedule a build and the user interface for this subtree might not be updated to reflect the new state.
    activeScreen = QuestionsScreen(onSelectAnswer: choosenAnswer); 
    });
  }

  

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold( 
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 93, 3, 247),
                Color.fromRGBO(212, 4, 249, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
//RENDER content conditionally
          child: activeScreen,  //conveniently output different widgets by storing different widgets in a variable-'activeScreen'
                                //now "StartScreen is executed, as activeScreen stores StartScreen widget"
        ),
      ),
    );
  }
}




//WHAT IT DOES??
// initiallize the activeScreen variable to startScreen widget
// it creates a container which have gradient color effect
// calls activeScreen variable which stores startScreen as a value ie startScreen widget is executed, which accepts switchScreen function as argument 
// inside startScreen widget on pressing the button, switchScreen function is called, inside which value of activeScreen variable is changed  to QuestionsScreen widget, which accept the choosenAnswer function as argument
// inside QuestionScreen widget on pressing the answer button, selected answer is passed to answerQuestion function, inside which that answer is passed to choosenAnswer function, which append and stores the selected data to display letter