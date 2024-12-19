class Flashcard {
  int id;
  String question;
  String answer;
  bool isTapped;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    this.isTapped = false,
  });

  void toggleTapped() {
    isTapped = !isTapped;
  }
}
