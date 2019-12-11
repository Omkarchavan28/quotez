class Quotes {
  String quoteText;
  String quoteAuthor;
  Quotes({this.quoteText, this.quoteAuthor});
  Quotes.fromJson(Map<String, dynamic> json) {
    quoteText = json['quoteText'];
    quoteAuthor = json['quoteAuthor'];
  }
}
