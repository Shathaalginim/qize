import 'package:flutter/material.dart';

import 'question.dart';

class AppBrain with ChangeNotifier {
  int _questionNumber = 0;
  String _selectedLanguage = 'swift';
  int _currentQuestionIndex = 0;
  List<int> _selectedAnswers = [];
  List<Question> _questionGroup = [];
  int _selectedAnswerIndex = -1;
  int _numCorrectAnswers = 0;

  void setSelectedLanguage(String language) {
    _selectedLanguage = language;
    _questionNumber = 0; // reset question number when language changes
    _currentQuestionIndex =
        0; // reset current question index when language changes
    _selectedAnswers = []; // reset selected answers when language changes
  }

  List<Question> getSelectedLanguageQuestions() {
    if (_selectedLanguage == 'java') {
      return [
        Question(
          q: 'Which keyword is used to create a new object in Java?',
          i: 'images/image-1.jpg',
          a: ['new', 'object', 'create', 'instance'],
          ca: 0,
        ),
        Question(
          q: 'Which of the following is not a primitive data type in Java?',
          i: 'images/image-1.jpg',
          a: ['int', 'double', 'boolean', 'string'],
          ca: 3,
        ),
        Question(
          q: 'What is the output of the following code? int x = 5; System.out.println(x++);',
          i: 'images/image-1.jpg',
          a: ['5', '6', '4', 'Compiler error'],
          ca: 1,
        ),
        Question(
          q: 'Which of the following is not a type of loop in Java?',
          i: 'images/image-1.jpg',
          a: ['for', 'while', 'do-while', 'switch'],
          ca: 3,
        ),
        Question(
          q: 'Which of the following access modifiers provides the widest accessibility?',
          i: 'images/image-1.jpg',
          a: ['private', 'protected', 'public', 'package-private'],
          ca: 2,
        ),
        Question(
          q: 'Which method is used to initialize an object in Java?',
          i: 'images/image-1.jpg',
          a: ['init()', 'create()', 'constructor()', 'start()'],
          ca: 2,
        ),
        Question(
          q: 'Which of the following is not a type of exception in Java?',
          i: 'images/image-1.jpg',
          a: [
            'IOException',
            'NullPointerException',
            'IndexOutOfBoundsException',
            'IntegerException'
          ],
          ca: 3,
        ),
        Question(
          q: ' Which of the following operators is used for logical AND in Java?',
          i: 'images/image-1.jpg',
          a: ['&', '&&', '||', '~'],
          ca: 1,
        ),
      ];
    } else if (_selectedLanguage == 'swift') {
      return [
        Question(
          q: 'What is the extension of Swift source code files?',
          i: 'images/image-2.jpg',
          a: ['.swift', '.sw', '.swiftcode', '.src'],
          ca: 0,
        ),
        Question(
          q: 'What is the output of the following code?\nprint(2 + 3, "Swift")',
          i: 'images/image-2.jpg',
          a: ['23Swift', '5Swift', 'Compilation error', 'Runtime error'],
          ca: 1,
        ),
        Question(
          q: 'Which keyword is used to declare a constant in Swift?',
          i: 'images/image-2.jpg',
          a: ['var', 'let', 'const', 'final'],
          ca: 1,
        ),
        Question(
          q: 'Which of the following is not a data type in Swift?',
          i: 'images/image-2.jpg',
          a: ['Int', 'Float', 'Double', 'Char'],
          ca: 3,
        ),
        Question(
          q: 'What is the syntax for declaring a constant in Swift?',
          i: 'images/image-2.jpg',
          a: [
            'var myConst = 10',
            'let myConst = 10',
            'const myConst = 10',
            'constant myConst = 10'
          ],
          ca: 3,
        ),
        Question(
          q: 'What is the keyword used to define a function in Swift?',
          i: 'images/image-2.jpg',
          a: ['func', 'def', 'fun', 'function'],
          ca: 0,
        ),
        Question(
          q: 'What is the operator used to define a range in Swift?',
          i: 'images/image-2.jpg',
          a: ['..', '...', ':', '-'],
          ca: 0,
        ),
        Question(
          q: 'Which keyword is used to define an optional variable in Swift?',
          i: 'images/image-2.jpg',
          a: ['var', 'let', 'option', 'Optional'],
          ca: 3,
        ),
        Question(
          q: ' What is the syntax for a for loop in Swift?',
          i: 'images/image-2.jpg',
          a: [
            ' for i = 0; i < 10; i++',
            'for i in 0..<10',
            'for i in 0...10',
            'for i = 0 to 10'
          ],
          ca: 1,
        ),
        Question(
          q: 'Which of the following is not a control flow statement in Swift?',
          i: 'images/image-2.jpg',
          a: ['if-else', 'switch', 'for loop', 'try-catch'],
          ca: 3,
        )
      ];
    } else if (_selectedLanguage == 'flutter') {
      return [
        Question(
          q: 'What is Flutter?',
          i: 'images/flutter-logo.jpg',
          a: [
            'programming language',
            'framework ',
            'database management',
            'web browser'
          ],
          ca: 1,
        ),
        Question(
          q: 'Which programming language is used for developing Flutter applications?',
          i: 'images/image-1.jpg',
          a: ['Java', 'Swift', 'Python', 'Dart'],
          ca: 3,
        ),
        Question(
          q: 'What is a widget in Flutter?',
          i: 'images/image-3.jpg',
          a: [
            'Data type ',
            'graphical element ',
            'data structure',
            'programming keyword'
          ],
          ca: 1,
        ),
        Question(
          q: 'What is hot reload in Flutter?',
          i: 'images/image-4.jpg',
          a: [
            'automatically fixing code',
            'Non',
            'Seeing the changes',
            'analyzing app performance'
          ],
          ca: 2,
        ),
        Question(
          q: 'What is the purpose of a MaterialApp widget in Flutter?',
          i: 'images/image-5.jpg',
          a: [
            'define the layout of the app',
            'define the theme of the app',
            'Non',
            'define the data models ',
          ],
          ca: 1,
        ),
        Question(
          q: 'What is the purpose of a scaffold widget in Flutter?',
          i: 'images/image-6.jpg',
          a: [
            'layout of the app',
            'Provide material design',
            'the navigation structure',
            'To handle user input'
          ],
          ca: 1,
        ),
        Question(
          q: 'What is the function of the main() method in a Flutter app?',
          i: 'images/image-9.jpg',
          a: [
            'To define the basic structure',
            'handle user input in the app',
            'To start the app and run',
            'define the layout of the app'
          ],
          ca: 2,
        ),
        Question(
          q: 'What widget would you use for repeating content in Flutter?',
          i: 'images/image-7.jpg',
          a: ['ExpandedView', 'ListView', 'Stack', 'ArrayView'],
          ca: 1,
        ),
      ];
    } else if (_selectedLanguage == 'C#') {
      return [
        Question(
          q: 'What is C# primarily used for?',
          i: 'images/image-2.jpg',
          a: [
            'Web development',
            'Game development',
            'Mobile development',
            'All of the above'
          ],
          ca: 3,
        ),
        Question(
          q: 'What is the latest version of C#?',
          i: 'images/image-3.jpg',
          a: ['C# 6.0', 'C# 7.0', 'C# 8.0', 'C# 9.0'],
          ca: 3,
        ),
        Question(
          q: 'What is an interface in C#?',
          i: 'images/image-4.jpg',
          a: [
            'class contain set of methods',
            'A method',
            'A template',
            'A contract'
          ],
          ca: 0,
        ),
        Question(
          q: 'What is the base class for all classes in C#?',
          i: 'images/image-5.jpg',
          a: ['Object', 'Base', 'Parent', 'Super'],
          ca: 1,
        ),
        Question(
          q: 'What is the C# keyword used for declaring a variable?',
          i: 'images/image-6.jpg',
          a: ['let', 'var', 'const', 'set'],
          ca: 2,
        ),
        Question(
          q: 'What is a delegate in C#?',
          i: 'images/image-7.jpg',
          a: [
            'A class',
            'A type-safe function pointer',
            'An event',
            'A method'
          ],
          ca: 2,
        ),
        Question(
          q: 'What is a namespace in C#?',
          i: 'images/image-8.jpg',
          a: [
            'A collection of classes',
            'A collection of methods',
            'A collection of variables',
            'A collection of events'
          ],
          ca: 1,
        ),
        Question(
          q: 'What is the C# keyword used for inheritance?',
          i: 'images/image-9.jpg',
          a: ['extend', 'inherit', 'base', 'derive'],
          ca: 3,
        ),
        Question(
          q: 'What is the C# keyword used for creating an object?',
          i: 'images/image-10.jpg',
          a: ['new', 'create', 'object', 'instance'],
          ca: 1,
        ),
        Question(
          q: 'What is LINQ in C#?',
          i: 'images/image-11.jpg',
          a: [
            'A database',
            'A query language',
            'A programming language',
            'A markup language'
          ],
          ca: 2,
        ),
      ];
    } else if (_selectedLanguage == 'React') {
      return [
        Question(
          q: 'What is React?',
          i: 'images/image-1.jpg',
          a: [
            'A JavaScript library',
            'A programming language',
            'database management',
            'An operating system'
          ],
          ca: 1,
        ),
        Question(
          q: 'What does JSX stand for?',
          i: 'images/image-2.jpg',
          a: [
            'JavaScript XML',
            'JavaScript XSL',
            'JavaScript XHTML',
            'JavaScript XHR'
          ],
          ca: 2,
        ),
        Question(
          q: 'Which of the following is not a key feature of React?',
          i: 'images/image-2.jpg',
          a: [
            'Virtual DOM',
            'One-way data binding',
            'Two-way data binding',
            'None of the above',
          ],
          ca: 2,
        ),
        Question(
          q: 'Which method is used to update the state in React?',
          i: 'images/image-2.jpg',
          a: [
            'setState()',
            'updateState()',
            'setVariable()',
            'updateVariable()',
          ],
          ca: 0,
        ),
        Question(
          q: 'Which of the following is a way to create a new React component?',
          i: 'images/image-2.jpg',
          a: [
            'create-react-app command',
            'react-component library',
            'Writ class React.Component',
            'None of the above',
          ],
          ca: 2,
        ),
        Question(
          q: 'What is the purpose of the render method in a React component?',
          i: 'images/image-2.jpg',
          a: [
            'To update the state',
            'Two-way data binding',
            'To render the component',
            'None of the above',
          ],
          ca: 2,
        ),
        Question(
          q: 'Which of the following is not a valid lifecycle method in React?',
          i: 'images/image-2.jpg',
          a: [
            'componentDidMount()',
            'componentWillUpdate()',
            'componentWillMount()',
            'componentWillReceive()',
          ],
          ca: 2,
        ),
      ];
    } else if (_selectedLanguage == 'HTML') {
      return [
        Question(
          q: 'Which tag is used to define a hyperlink in HTML?',
          i: 'images/image-2.jpg',
          a: ['<link>', '<a>', '<img>', '<script>'],
          ca: 1,
        ),
        Question(
          q: 'Which keyword is used to declare a constant in Swift?',
          i: 'images/image-2.jpg',
          a: ['var', 'let', 'const', 'final'],
          ca: 1,
        ),
        Question(
          q: 'Which tag is used to insert an image in HTML?',
          i: 'images/image-2.jpg',
          a: ['<picture>', '<photo>', '<img>', '<image>'],
          ca: 2,
        ),
        Question(
          q: 'Which attribute is used to define alternative text for an image in HTML?',
          i: 'images/image-2.jpg',
          a: ['alt', 'src', 'title', 'href'],
          ca: 0,
        ),
        Question(
          q: ' Which tag is used to create an unordered list in HTML?',
          i: 'images/image-2.jpg',
          a: ['<ul>', '<ol>', '<li>', '<dl>'],
          ca: 0,
        ),
        Question(
          q: 'Which tag is used to create a table in HTML?',
          i: 'images/image-2.jpg',
          a: ['<table>', '<tr>', '<td>', '<th>'],
          ca: 0,
        ),
        Question(
          q: 'Which attribute is used to define the width of a table in HTML?',
          i: 'images/image-2.jpg',
          a: ['width', 'size', 'style', 'class'],
          ca: 0,
        ),
        Question(
          q: 'Which tag is used to create a form in HTML?',
          i: 'images/image-2.jpg',
          a: ['<form>', '<input>', '<select>', '<textarea>'],
          ca: 0,
        ),
      ];
    } else if (_selectedLanguage == 'css') {
      return [
        Question(
          q: 'Which property is used to change the background color of an element?',
          i: 'images/css-bg-color.jpg',
          a: ['color', 'font-size', 'background-color', 'text-align'],
          ca: 2,
        ),
        Question(
          q: 'Which property is used to set the text color of an element?',
          i: 'images/css-text-color.jpg',
          a: ['color', 'font-color', 'background-color', 'text-color'],
          ca: 0,
        ),
        Question(
          q: 'Which property is used to change the font size of an element?',
          i: 'images/css-font-size.jpg',
          a: ['font-size', 'text-size', 'size', 'font-type'],
          ca: 0,
        ),
        Question(
          q: 'Which property is used to align text within an element?',
          i: 'images/css-text-align.jpg',
          a: ['align', 'text-align', 'justify', 'center'],
          ca: 1,
        ),
        Question(
          q: 'Which property is used to add space between letters?',
          i: 'images/css-letter-spacing.jpg',
          a: ['letter-spacing', 'word-spacing', 'line-height', 'text-spacing'],
          ca: 0,
        ),
        Question(
          q: 'Which property is used to add space between words?',
          i: 'images/css-word-spacing.jpg',
          a: ['letter-spacing', 'word-spacing', 'line-height', 'text-spacing'],
          ca: 1,
        ),
        Question(
          q: 'Which property is used to set the height of an element?',
          i: 'images/css-height.jpg',
          a: ['height', 'element-height', 'element-size', 'size'],
          ca: 0,
        ),
        Question(
          q: 'Which property is used to set the width of an element?',
          i: 'images/css-width.jpg',
          a: ['width', 'element-width', 'element-size', 'size'],
          ca: 0,
        ),
      ];
    } else if (_selectedLanguage == 'js') {
      return [
        Question(
          q: 'Which of the following is a primitive data type in JavaScript?',
          i: 'images/image-2.jpg',
          a: ['Object', 'String', 'Array', 'Function'],
          ca: 1,
        ),
        Question(
          q: 'What is the result of the following code? console.log(5 + "5");',
          i: 'images/image-2.jpg',
          a: ['10', '"55"', '"5 + 5"', 'NaN'],
          ca: 1,
        ),
        Question(
          q: 'Which method is used to add an element to the end of an array in JavaScript?',
          i: 'images/image-2.jpg',
          a: ['push()', 'pop()', 'shift()', 'unshift()'],
          ca: 0,
        ),
        Question(
          q: 'What is the correct way to write an if statement in JavaScript?',
          i: 'images/image-2.jpg',
          a: [
            'if {x > 5} {doSomething();}',
            'if (x > 5) {doSomething();}',
            'if x > 5 then doSomething()',
            'if (x > 5) doSomething();'
          ],
          ca: 1,
        ),
        Question(
          q: 'Which operator is used to compare two values in JavaScript?',
          i: 'images/image-2.jpg',
          a: ['==', '=', '===', '!='],
          ca: 2,
        ),
        Question(
          q: 'Which method is used to convert a string to an integer in JavaScript?',
          i: 'images/image-2.jpg',
          a: [' parseInt()', 'parseFloat()', 'toString()', 'toFixed()'],
          ca: 0,
        ),
        Question(
          q: 'Which of the following is not a loop structure in JavaScript?',
          i: 'images/image-2.jpg',
          a: ['for', 'while', 'do-while', 'until'],
          ca: 3,
        ),
        Question(
          q: 'Which method is used to remove the last element from an array in JavaScript?',
          i: 'images/image-2.jpg',
          a: ['push()', 'pop()', 'shift()', 'unshift()'],
          ca: 1,
        ),
        Question(
          q: 'What is the result of the following code? console.log(typeof null);',
          i: 'images/image-2.jpg',
          a: ['null', 'undefined', 'object', 'number'],
          ca: 2,
        ),
        Question(
          q: 'Which keyword is used to declare a variable in JavaScript?',
          i: 'images/image-2.jpg',
          a: ['var', 'let', 'const', 'all of the above'],
          ca: 3,
        ),
      ];
    } else {
      return [];
    }
  }

  void checkAnswer(int selectedOptionIndex) {
    _selectedAnswers.add(selectedOptionIndex);
    if (selectedOptionIndex == _questionGroup[_currentQuestionIndex].ca) {
      // if selected option is correct answer, set the background color to green
      _questionGroup[_currentQuestionIndex].backgroundColor = Colors.green;
      _numCorrectAnswers++;
    } else {
      _questionGroup[_currentQuestionIndex].backgroundColor = Colors.red;
    }

    Future.delayed(Duration(milliseconds: 500), () {
      // Update the UI to show the new number of correct answers
      notifyListeners();
    });
  }

  String getSelectedLanguageImage() {
    if (_selectedLanguage == 'java') {
      return 'java.jpg';
    } else if (_selectedLanguage == 'swift') {
      return 'swift.jpg';
    } else {
      return '';
    }
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questionGroup.length - 1) {
      _currentQuestionIndex++;
      _selectedAnswers.clear();
    }
  }

  List<String> getAnswerOptions() {
    _questionGroup = getSelectedLanguageQuestions();
    if (_currentQuestionIndex >= 0 &&
        _currentQuestionIndex < _questionGroup.length) {
      return _questionGroup[_currentQuestionIndex].a;
    } else {
      return [];
    }
  }

  Question getCurrentQuestion() {
    _questionGroup = getSelectedLanguageQuestions();
    if (_currentQuestionIndex >= 0 &&
        _currentQuestionIndex < _questionGroup.length) {
      return _questionGroup[_currentQuestionIndex];
    } else {
      return Question(
        q: 'NONN',
        i: 'images/image-2.jpg',
        a: ['NOM', 'NOM', 'NOM ', 'NOM '],
        ca: 0,
      ); // or throw an exception, or return a default Question object
    }
  }

  String getCurrentImage() {
    _questionGroup = getSelectedLanguageQuestions();
    if (_currentQuestionIndex >= 0 &&
        _currentQuestionIndex < _questionGroup.length) {
      return _questionGroup[_currentQuestionIndex].i;
    } else {
      return '';
    }
  }

  bool isAnswerCorrect() {
    _questionGroup = getSelectedLanguageQuestions();
    if (_selectedAnswers.length > 0 &&
        _currentQuestionIndex >= 0 &&
        _currentQuestionIndex < _questionGroup.length) {
      return _selectedAnswers.last == _questionGroup[_currentQuestionIndex].ca;
    } else {
      return false;
    }
  }

  Color getAnswerColor(int index) {
    if (_selectedAnswers.contains(index) && isAnswerCorrect()) {
      return Colors.green;
    } else if (_selectedAnswers.contains(index) && !isAnswerCorrect()) {
      return Colors.red;
    } else {
      return Color.fromARGB(255, 244, 244, 244);
    }
  }

  double getProgress() {
    return _questionNumber / _questionGroup.length;
  }

  int getSelectedAnswerIndex() {
    return _selectedAnswerIndex;
  }

  bool isLastQuestion() {
    return _currentQuestionIndex == _questionGroup.length - 1;
  }

  bool isSelectedAnswer(int index) {
    return _selectedAnswers.contains(index);
  }
}
