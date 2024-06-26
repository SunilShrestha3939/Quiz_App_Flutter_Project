import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummery extends StatelessWidget{
  const QuestionsSummery(this.summeryData, {super.key});
  
  final List<Map<String, Object>> summeryData;  //type object means it can be of any type
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(   //makes its direct child scrollable if it exceeds its set-boundary ie height-300 
        child: Column(
          //to convert list into widget so that children can accept
          children: summeryData.map((data){   //map will be executed for every list item 
                                              //ie all the list of MAP is converted to Row widget
            return Row(children: [
              Container(
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                //  color: Color.fromARGB(255, 4, 180, 95),
                   color :(data['user_answer'] == data['correct_answer']) ?  Colors.green : (  Color.fromARGB(255, 179, 19, 8))

                ),
                child: Text(((data['question_index'] as int) + 1).toString(),
                style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 245, 245, 246),
                      fontSize: 20,  
                    ),
                ),
              ), //"as" is used to type cast, mostly used with map, flutter dont khow the exact type of value of key "question_index" ,
              //small bracket is used to indicate that this should be evaluated as one value
              //"Text" only accepts string type so we need to convert int type to string type by using ".toString()"
              Expanded(   //as we are using Expanded inside of Row so the widget that we pass as the children of expanded can't take the width more than the max width of Row ie width of screen
                          //column can't take the width more than the width of screen ie it restricts the width
                          //without Expanded, Column ignores the max width of Row and streach it
                child: Column(children: [
                  const SizedBox(height: 30,),
                  Text(data['question'] as String,
                  // textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    color: Color.fromRGBO(0, 0, 255, 1),
                    fontSize: 14, 
                    fontWeight: FontWeight.bold, 
                  ),),
                  Text(data['user_answer'] as String,
                  style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 7, 0, 19),
                    fontSize: 13,  
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(data['correct_answer'] as String,
                  style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 220, 224, 230),
                    fontSize: 12, 
                  ),),
                  // const SizedBox(height: 30,),
                ],),
              )
            ],);
          } ).toList(), 
          //here argument'data' is automatically passed by flutter
          //map returns Iterables (of widget) so to convert iterables into list we use ".toList()"
        ),
      ),
    );
  }

}