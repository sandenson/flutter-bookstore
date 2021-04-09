class Book {
  String title, author, weight, language;
  double price;
  int year;

  Book({
    String title,
    String author,
    double price,
    int year,
    String weight,
    String language,
  }) {
    this.title = title;
    this.author = author;
    this.price = price;
    this.year = year;
    this.weight = weight;
    this.language = language;
  }
}
