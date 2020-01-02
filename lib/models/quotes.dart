class Quotes {
  String id;
  String quoteText;
  String quoteAuthor;
  Quotes({this.quoteText, this.quoteAuthor, this.id});
  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quoteText = json['quoteText'];
    quoteAuthor = json['quoteAuthor'];
  }
}
