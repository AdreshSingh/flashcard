import 'package:flashcard/domain/models/flashcard.dart';
import 'package:flashcard/flashcard_form.dart';
import 'package:flashcard/flashcard_list.dart';
import 'package:flutter/material.dart';

class FlashcardHomepage extends StatefulWidget {
  const FlashcardHomepage({super.key});
  @override
  State<FlashcardHomepage> createState() => _FlashcardHomepageState();
}

class _FlashcardHomepageState extends State<FlashcardHomepage> {
  // index for each card
  int cardId = 0;

  // delete the card
  void gotToAddScreen() async {
    // will refresh to show update
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => (const FlashcardForm()),
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    FlashcardList().addFlashcard(
      Flashcard(
        id: 0,
        question: "how r u?",
        answer: "i am fine",
      ),
    );

    FlashcardList().addFlashcard(
      Flashcard(
        id: 1,
        question: "How did this?",
        answer: "Nothing special",
      ),
    );

    FlashcardList().addFlashcard(
      Flashcard(
        id: 2,
        question: "Well, tell me abt u?",
        answer: "I am me",
      ),
    );

    FlashcardList().addFlashcard(
      Flashcard(
        id: 3,
        question: "how r u?",
        answer: "i am fine",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flashcard"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/background.jpg"),
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: FlashcardList.cards.length,
          itemBuilder: (context, index) {
            final card = FlashcardList.cards[index];

            return ListTile(
              title: Text(card.question),
              subtitle: Text(card.answer),
              trailing: IconButton(
                onPressed: () {
                  FlashcardList().deleteFlashcard(index);
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotToAddScreen();
        },
        child: const Icon(Icons.plus_one_sharp),
      ),
    );
  }
}
