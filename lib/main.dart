import 'package:flutter/material.dart';
import 'package:qize/home.dart';
import 'package:qize/question.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:async';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 64, 194, 184),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: HomePage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  final String language;

  ExamPage({required this.language});

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  AppBrain _appBrain = AppBrain();
  int _currentStep = 1;
  int _totalSteps = 0;
  int _currentQuestionNumber = 0;
  Timer? _timer;
  int _secondsLeft = 60;
  double _progressValue = 1.0;

  @override
  void initState() {
    super.initState();
    _appBrain.setSelectedLanguage(widget.language);
    _currentQuestionNumber++;
    List<Question> questions = _appBrain.getSelectedLanguageQuestions();
    if (questions.isNotEmpty) {
      _totalSteps = questions.length;
    } else {
      _totalSteps = 1; // set a default value for total steps
    }
  }

  // void _endExam() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Time\'s up!'),
  //         content: Text('You have completed the exam.'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               Navigator.of(context).pop();
  //               _currentQuestionNumber = 0;
  //               _totalSteps = 0;
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   _stopTimer();
  //   super.dispose();
  // }

  // void _startTimer() {
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _secondsLeft--;
  //       _progressValue = _secondsLeft / 60;
  //       if (_secondsLeft == 0) {
  //         _stopTimer();
  //         _endExam();
  //       }
  //     });
  //   });
  // }

  // void _stopTimer() {
  //   _timer?.cancel();
  //   _timer = null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 235, 233),
        appBar: AppBar(
          title: Text('Programming Exam'),
          backgroundColor: Color.fromARGB(255, 63, 193, 178),
          elevation: 0,
        ),
        body: Column(children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: SizedBox(
          //     height: 30,
          //     width: 30,
          //     child: CircularProgressIndicator(
          //       value: _progressValue,
          //       backgroundColor: Colors.grey,
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          //       strokeWidth: 1,
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius:
                BorderRadius.circular(16.0), // Change this like you want
            clipBehavior: Clip.antiAlias,
            child: StepProgressIndicator(
              totalSteps: _totalSteps,
              size: 8,
              currentStep: _currentStep,
              selectedColor: Colors.white,
              unselectedColor: Colors.grey,
              roundedEdges: Radius.circular(100),
              padding: 8,
              selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white],
              ),
              unselectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(250, 224, 203, 203),
                  Color.fromARGB(250, 224, 203, 203)
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  QuestionWithOptionsWidget(
                    options: _appBrain.getAnswerOptions(),
                    question: _appBrain.getCurrentQuestion().q,
                    currentQuestionNumber: _currentQuestionNumber,
                    totalSteps: _totalSteps,
                    onNextQuestion: () {
                      setState(() {
                        if (_appBrain.isLastQuestion()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Congratulations!'),
                                content: Image.asset(
                                  'images/winner.gif',
                                  height: 150,
                                  width: 150,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      _currentQuestionNumber = 0;
                                      _totalSteps = 0;
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          _appBrain.nextQuestion();
                          _currentStep++;
                          _currentQuestionNumber++;
                        }
                      });
                    },
                    onOptionSelected: (int index) {
                      _appBrain.checkAnswer(index);
                      setState(() {});
                    },
                    appBrain: _appBrain,
                  ),
                  SizedBox(height: 50),
                  _appBrain.isAnswerCorrect()
                      ? Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                            size: 50.0,
                          ),
                        )
                      : Text(""),
                ]),
          ),
        ]));
  }
}

// class QuestionWithOptionsWidget extends StatelessWidget {
//   final String question;
//   final List<String> options;
//   final Function(int) onOptionSelected;
//   final AppBrain appBrain;
//   final int totalSteps;
//   final int currentQuestionNumber;
//   final VoidCallback onNextQuestion;
//   int _timeRemaining = 30; // 30 seconds for example
//   late Timer _timer;

//   QuestionWithOptionsWidget({
//     Key? key,
//     required this.question,
//     required this.options,
//     required this.onOptionSelected,
//     required this.appBrain,
//     required this.totalSteps,
//     required this.currentQuestionNumber,
//     required this.onNextQuestion,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             question,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 15.0,
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: appBrain.getAnswerOptions().length,
//               itemBuilder: (BuildContext context, int index) {
//                 String answer = appBrain.getAnswerOptions()[index];
//                 Color buttonColor = appBrain.getAnswerColor(index);
//                 return Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: MaterialButton(
//                     color: appBrain.getAnswerColor(index),
//                     onPressed: () {
//                       appBrain.checkAnswer(index);
//                       onOptionSelected(index);
//                     },
//                     child: Row(
//                       children: [
//                         Text(
//                           '${String.fromCharCode(65 + index)}    ',
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),Text(
//                           answer,
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             child: Text('Next Question'),
//             onPressed: onNextQuestion,
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             '$currentQuestionNumber / $totalSteps',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 15.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class QuestionWithOptionsWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(int) onOptionSelected;
  final AppBrain appBrain;
  final int totalSteps;
  final int currentQuestionNumber;
  final VoidCallback onNextQuestion;
  int _timeRemaining = 30;
  late Timer _timer;

  QuestionWithOptionsWidget({
    Key? key,
    required this.question,
    required this.options,
    required this.onOptionSelected,
    required this.appBrain,
    required this.totalSteps,
    required this.currentQuestionNumber,
    required this.onNextQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 63, 193, 178),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: appBrain.getAnswerOptions().length,
              itemBuilder: (BuildContext context, int index) {
                String answer = appBrain.getAnswerOptions()[index];
                Color buttonColor = appBrain.getAnswerColor(index);
                bool isSelected = appBrain.isSelectedAnswer(index);
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: buttonColor,
                    onPressed: () {
                      appBrain.checkAnswer(index);
                      onOptionSelected(index);
                    },
                    child: Row(
                      children: [
                        Text(
                          '${String.fromCharCode(65 + index)}    ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          answer,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Next Question'),
            onPressed: onNextQuestion,
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(200, 76, 175, 80),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            '$currentQuestionNumber / $totalSteps',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
