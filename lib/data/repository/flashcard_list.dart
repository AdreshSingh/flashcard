import 'package:flashcard/domain/models/flashcard.dart';

import '../../domain/repository/flashcard_repo.dart';

class FlashcardList implements FlashcardRepo {
  // list of cards
  static final List<Flashcard> cards = [];
  static int numberOfCards = 0;

  // will add a new card
  @override
  Future<void> addFlashcard(Flashcard flashCard) async {
    cards.add(flashCard);
    numberOfCards++;
  }

  // deletes the existing card
  @override
  Future<void> deleteFlashcard(int id) async {
    cards.removeAt(id);
    numberOfCards--;
  }

  // updates the existing card
  @override
  Future<void> updateFlashcard(Flashcard flashCard) async {
    // Find the index of the card with the same id
    int index = cards.indexWhere((card) => card.id == flashCard.id);

    if (index != -1) {
      // Update the question and answer of the matching card
      cards[index]
        ..question = flashCard.question
        ..answer = flashCard.answer;
    }
  }
}
