class ReviewModel {
  final String title;
  final String text;
  final String username;
  final double rating;
  final String date;

  const ReviewModel({
    required this.title,
    required this.username,
    required this.rating,
    required this.date,
    required this.text,
  });
}
