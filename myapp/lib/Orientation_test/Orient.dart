import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Constantes.dart';
import 'Answer.dart';
import 'Question.dart';
import 'Result.dart';

class Orient extends StatefulWidget {
  @override
  _OrientState createState() => _OrientState();
}

class _OrientState extends State<Orient> {
  var questionIndex = 0;
  final questions = [
    {
      'questionText': '1.	In your opinion, choosing a profession means :',
      'answers': [
        {'text': '	Secure outlets, a job', 'score': 10},
        {'text': '	Make all your dreams come true', 'score': 5}
      ]
    },
    {
      'questionText':
          '2.	You spend a holiday for 15 in an apartment by the sea :',
      'answers': [
        {
          'text':
              '	You care about what everyone wants to do, to satisfy everyone',
          'score': 6
        },
        {'text': '	You set up a precise schedule of activities', 'score': 3}
      ]
    },
    {
      'questionText': '3.	I like:',
      'answers': [
        {'text': 'Personalize things, invent, stand out', 'score': 2},
        {
          'text':
              'Do concrete things (manual activities, experiments or technologies)',
          'score': 5
        }
      ]
    },
    {
      'questionText': '4.	In your later job you want:',
      'answers': [
        {'text': 'Learn new things all the time', 'score': 5},
        {'text': 'Being in the field one way or another', 'score': 5},
      ]
    },
    {
      'questionText':
          '5.	You have two hours for an activity in the week, you choose instead:',
      'answers': [
        {'text': '	A voluntary activity', 'score': 5},
        {'text': '	A sporting activity', 'score': 5}
      ]
    },
    {
      'questionText': '6.	It\'s almost your best friend\'s birthday:',
      'answers': [
        {
          'text':
              '	You choose the decoration, the dishes or the editing of the playlist',
          'score': 5
        },
        {'text': '	You take charge of the surprise evening project', 'score': 5}
      ]
    },
    {
      'questionText':
          '7.	You are a personality in the hairdressing world because:',
      'answers': [
        {'text': '	You have developed the largest chain of salons', 'score': 5},
        {
          'text':
              '	Your creations are requested by all the stars and other VIPs',
          'score': 5
        },
      ]
    },
    {
      'questionText': '8.	What suits you best:',
      'answers': [
        {'text': '	I have a passionate side	', 'score': 3},
        {
          'text': 'I take initiatives, I easily launch into projects',
          'score': 2
        },
      ]
    },
    {
      'questionText': '10.	In the sports team:',
      'answers': [
        {'text': 'I\'m learning to play beginners	', 'score': 7},
        {'text': '	I am the team captain', 'score': 2},
      ]
    },
    {
      'questionText':
          '11.	You bring home an IKEA-type piece of furniture in kit form:',
      'answers': [
        {
          'text':
              'You attack the ball in the head, without asking yourself any questions, what matters is to launch	',
          'score': 10
        },
        {
          'text':
              '	You read the instructions carefully, take an inventory of your tools before going step by step',
          'score': 4
        },
      ]
    },
    {
      'questionText': '12.	Your room is rather:',
      'answers': [
        {
          'text':
              'Claire, in order, everything in its place, we find ourselves there	',
          'score': 3
        },
        {'text': 'Personalized, inspiring, she looks like you	', 'score': 4},
      ]
    },
    {
      'questionText': '13.	What is most like you:',
      'answers': [
        {'text': 'I have lots of ideas all the time.	', 'score': 1},
        {'text': '	I always look for the why and the how', 'score': 6},
      ]
    },
    {
      'questionText': '14.	Your thing is rather:',
      'answers': [
        {'text': 'Listen, advise, help etc.	', 'score': 3},
        {'text': 'Reasoning, procrastinating, debating etc.', 'score': 5},
      ]
    },
    {
      'questionText': '15.	You work in finance:',
      'answers': [
        {'text': 'You are the CFO of a large company', 'score': 1},
        {
          'text':
              '	You are a top-flight financial analyst who knows how to decipher market trends',
          'score': 4
        },
      ]
    },
    {
      'questionText': '16.	I choose a school for:',
      'answers': [
        {
          'text':
              'Recognition of its in-depth teaching and the content of the programs that already interests you	',
          'score': 2
        },
        {'text': 'Its good supervision and its sure outlets', 'score': 5},
      ]
    },
    {
      'questionText': '17.	What characterizes you the most:',
      'answers': [
        {'text': 'I need to see people	', 'score': 4},
        {'text': '	I need freedom	', 'score': 2},
      ]
    },
    {
      'questionText':
          '18.	Your association offers a sales stand at a festival:',
      'answers': [
        {'text': '	You took the lead, build the project	', 'score': 3},
        {
          'text':
              '	You welcome to the stand, inform and advise potential buyers	',
          'score': 5
        },
      ]
    },
    {
      'questionText': '19.	You would rather be: ',
      'answers': [
        {'text': '	Internationally renowned researcher	', 'score': 1},
        {'text': 'At the head of a small or large company	', 'score': 6},
      ]
    },
    {
      'questionText': '20.	The group of words that suits you best: ',
      'answers': [
        {'text': 'Achievement, result, practice, materialize	', 'score': 2},
        {
          'text': 'Method, rigor, apply a protocol, enforce a rule	',
          'score': 7
        },
      ]
    },
  ];
  var totalScore = 0;
  void answerQuestion(int score) {
    totalScore += score;
    if (questionIndex < questions.length) {
      print('we have more qestions ');
    } else {}
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Orientation Test',
            style: GoogleFonts.pacifico(textStyle: style),
          ),
        ),
        body: questionIndex < questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Question(questions[questionIndex]['questionText']),
                  ...(questions[questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(
                        () => answerQuestion(answer['score']), answer['text']);
                  }).toList(),
                ],
              )
            : Result(totalScore, restartQuiz));
  }
}
