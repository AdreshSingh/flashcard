import 'package:flashcard/domain/models/flashcard.dart';
import 'package:flashcard/data/repository/flashcard_list.dart';
import 'package:flutter/material.dart';

class FlashcardForm extends StatefulWidget {
  const FlashcardForm({super.key});

  @override
  State<FlashcardForm> createState() => _FlashcardFormState();
}

class _FlashcardFormState extends State<FlashcardForm> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  // add new question to card
  void addCard() async {
    await FlashcardList().addFlashcard(Flashcard(
      id: FlashcardList.numberOfCards,
      question: _questionController.text,
      answer: _answerController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text(
          "Flashcard",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        elevation: 1,
        shadowColor: Colors.green[300],
      ),
      // parent continer for background image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/background.jpg"),
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //? for question field
                TextField(
                  controller: _questionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(.6),
                    label: Text("Question",
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w600)),
                    border: const OutlineInputBorder(),
                  ),
                ),

                //? for vertical gap
                const SizedBox(
                  height: 10,
                ),

                //? for answer textfield
                TextField(
                  controller: _answerController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(.6),
                    label: Text("Answer",
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w600)),
                    border: const OutlineInputBorder(),
                  ),
                ),

                // ? for vertical gap
                const SizedBox(
                  height: 10,
                ),

                // ? confirmation button
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.white.withOpacity(.6),
                  onPressed: () {
                    addCard();
                  },
                  child: const Text(
                    "Confirm!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
