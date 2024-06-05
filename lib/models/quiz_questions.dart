class QuizQuestion{
  const QuizQuestion(this.text, this.answers);   //constructor to take some arguments which will be used to mapped to properties 

  final String text;    //questions
  final List<String> answers;    //list of answers

  List<String> getShuffledAnswers(){
    // List.of(answers).shuffle();    //List-(Built in class in dart) which offers couple of utility constructor function that makes easy to create different lists
                          //"Of"- utility constructor function creates new list based on another list ie it copies an existing list 
                          // here new list will be shuffled and old list will be untouched ie first copied the list then shuffled the list
                          //shuffle return nothing ie it doesnt yield the shuffled list instead it shuffles the list on which we call it in place and doesnt give us updated list
                          //so to return updated list we make variable, shuffle that and return it
    final shuffledList = List.of(answers);  //copied
    shuffledList.shuffle(); //suffled the copied list 
    return shuffledList;
    //  we are just editing the value of final variable not reassigning it
  }
}



//it is just the blueprint/layout to display the question and answer in display