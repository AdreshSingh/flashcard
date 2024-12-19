import '../models/flashcard.dart';

abstract class FlashcardRepo {
  // add new card
  Future<void> addFlashcard(Flashcard flashCard);

  // update a existing card
  Future<void> updateFlashcard(Flashcard flashCard);

  // delete the existing card
  Future<void> deleteFlashcard(int id);
}
