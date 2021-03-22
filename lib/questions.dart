class Question {
  String question;
  bool ans;
  //Constructor
  Question(this.question, this.ans);
  //Call like Question a = Question.unanswered(question: 'I don't have an answer')
  Question.unanswered({this.question});
}

//In dart we don't exactly have the concept of constructor overloading
//Instead we have named constructors and unnamed constructors
//Dart allows only one unnamed constructor like the Question() constructor above
//Named constructors look like
