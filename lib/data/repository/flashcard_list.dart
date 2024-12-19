import 'package:flashcard/domain/models/flashcard.dart';

import '../../domain/repository/flashcard_repo.dart';

class FlashcardList implements FlashcardRepo {
  // list of cards
  static final List<Flashcard> cards = [];
  static final numberOfCards = cards.length;

  // will add a new card
  @override
  Future<void> addFlashcard(Flashcard flashCard) async {
    cards.add(flashCard);
  }

  // deletes the existing card
  @override
  Future<void> deleteFlashcard(int id) async {
    cards.removeAt(id);
  }

  // updates the existing card
  @override
  Future<void> updateFlashcard(Flashcard flashCard) async {
    bool isExist = false;
    for (var i = 0; i < numberOfCards; i++) {
      if (flashCard.id == cards[i].id) {
        cards[i].question = flashCard.question;
        cards[i].answer = flashCard.answer;
        isExist = true;
        break;
      }
    }

    if (!isExist) {
      cards.add(flashCard);
    }
  }
}
