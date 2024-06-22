import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import '../models/question.dart';
import '../models/question_data.dart';

class QuestionWidget extends StatefulWidget {
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int currentQuestionId = 1;
  Question? currentQuestion;
  bool? answer;

  // Future<Question> fetchQuestion(int id) async {
  //   final response = await http.get(
  //       Uri.parse('https://dhrqldvp-3000.asse.devtunnels.ms/api/question/$id'));
  //   if (response.statusCode == 200) {
  //     final decoded = json.decode(response.body);
  //     return Question.fromJson(decoded);
  //   } else {
  //     throw Exception('Failed to load question');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    loadQuestion(currentQuestionId);
  }

  // void loadQuestion(int id) async {
  //   try {
  //     Question question = await fetchQuestion(id);
  //     setState(() {
  //       currentQuestion = question;
  //       answer = null; // Reset answer state when loading a new question
  //     });
  //   } catch (error) {
  //     print('Error loading question: $error');
  //   }
  // }

   void loadQuestion(int id) {
    setState(() {
      currentQuestion = getQuestionById(id);
      answer = null; // Reset answer state when loading a new question
    });
  }

  String getImageForDamage(String damage) {
    switch (damage) {
      case "Power Supply":
        return 'images/power_supply.png';
      case "Processor":
        return 'images/processor.png';
      case "Motherboard":
        return 'images/motherboard.png';
      case "Harddisk":
        return 'images/hard_disk.png';
      case "CD/DVD ROM":
        return 'images/cd_dvd_rom.png';
      case "RAM":
        return 'images/ram.png';
      default:
        return 'images/power_supply.png';
    }
  }

  void handleAnswer(bool selectedAnswer) {
    setState(() {
      answer = selectedAnswer;
    });

    // Load the next question after a short delay to show the effect
    Future.delayed(Duration(milliseconds: 300), () {
      loadQuestion(selectedAnswer
          ? currentQuestion!.nextQuestionId ?? 1
          : currentQuestion!.nextFalseQuestionId ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diagnosa Kerusakan Hardware",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: currentQuestion == null
          ? Center(child: CircularProgressIndicator(color: Colors.black,))
          : Container(
             decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background_.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.1
                ),
              ),
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              currentQuestion!.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        if (currentQuestion!.repairAdvice == null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                iconSize: 30,
                                icon: Icon(Icons.check_circle,
                                    color: answer == true
                                        ? Colors.green
                                        : Colors.grey),
                                onPressed: () {
                                  handleAnswer(true);
                                },
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(Icons.cancel,
                                    color:
                                        answer == false ? Colors.red : Colors.grey),
                                onPressed: () {
                                  handleAnswer(false);
                                },
                              ),
                            ],
                          ),
                        if (currentQuestion!.repairAdvice != null)
                          Card(
                            margin: EdgeInsets.all(16.0),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text("Jika hal tersebut benar, maka: "),
                                  SizedBox(height: 5),
                                  Text(
                                    "Kerusakan: ${currentQuestion!.repairAdvice!.damage}",
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Image.asset(
                                      getImageForDamage(
                                          currentQuestion!.repairAdvice!.damage),
                                      width: 250,
                                      height: 250),
                                  SizedBox(height: 10),
                                  Text(
                                    'Saran kami ${currentQuestion!.repairAdvice!.advice}',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(height: 20.0),
                        if (currentQuestion!.repairAdvice != null)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              loadQuestion(1);
                            },
                            child: Text('Reset'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
    );
  }
}
