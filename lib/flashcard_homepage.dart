import 'package:flashcard/domain/models/flashcard.dart';
import 'package:flashcard/flashcard_form.dart';
import 'package:flashcard/data/repository/flashcard_list.dart';
import 'package:flutter/material.dart';

class FlashcardHomepage extends StatefulWidget {
  const FlashcardHomepage({super.key});
  @override
  State<FlashcardHomepage> createState() => _FlashcardHomepageState();
}

class _FlashcardHomepageState extends State<FlashcardHomepage> {
  // index for each card
  int cardId = 0;

  // ? tracking for tap
  //? animationing visiblity
  void cardTapped(Flashcard card) async {
    setState(() {
      card.toggleTapped();
    });
  }

  //? navigate to the form page
  void gotToAddScreen(Flashcard? card) async {
    // will refresh to show update
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => (FlashcardForm(
          card: card,
        )),
      ),
    );
    setState(() {});
  }

  //? delete a specific card
  void deleteCard(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deleting flashcard"),
          content: const Text("Are you sure to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                FlashcardList().deleteFlashcard(index);
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text("Confirm"),
            )
          ],
        );
      },
    );
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

            return GestureDetector(
              onTap: () => cardTapped(card),
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withOpacity(0.6),
                      Colors.white.withOpacity(0.4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // question
                    Text(
                      "Question",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      card.question,
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    // answer

                    Flexible(
                      flex: 2,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        height: card.isTapped ? 50 : 20,
                        child: card.isTapped
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Answer",
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    card.answer,
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "click to see answer",
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                      ),
                    ),

                    // buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ? edit button
                        IconButton(
                          onPressed: () {
                            gotToAddScreen(card);
                          },
                          icon: const Icon(Icons.edit),
                        ),

                        // ? delete button
                        IconButton(
                          onPressed: () {
                            deleteCard(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gotToAddScreen(null);
        },
        child: const Icon(Icons.plus_one_sharp),
      ),
    );
  }
}
