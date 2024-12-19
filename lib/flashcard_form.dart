import 'package:flashcard/domain/models/flashcard.dart';
import 'package:flashcard/data/repository/flashcard_list.dart';
import 'package:flutter/material.dart';

class FlashcardForm extends StatefulWidget {
  final Flashcard? card;
  const FlashcardForm({super.key, required this.card});

  @override
  State<FlashcardForm> createState() => _FlashcardFormState();
}

class _FlashcardFormState extends State<FlashcardForm> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  // add new question to card
  void addCard() async {
    await FlashcardList().addFlashcard(Flashcard(
      id: DateTime.now().millisecondsSinceEpoch,
      question: _questionController.text,
      answer: _answerController.text,
    ));
  }

  // update the card
  void updateCard(Flashcard card) async {
    await FlashcardList().updateFlashcard(Flashcard(
      id: FlashcardList.cards.length,
      question: _questionController.text,
      answer: _answerController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // ? prepopulating if it selected for editting
    _questionController.text = widget.card?.question ?? "";
    _answerController.text = widget.card?.answer ?? "";
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
                    widget.card == null ? addCard() : updateCard(widget.card!);
                  },
                  child: Text(
                    widget.card == null ? "Confirm!" : "Update",
                    style: const TextStyle(
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
