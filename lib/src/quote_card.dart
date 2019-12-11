import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotez/models/quotes.dart';

class QuoteCard extends StatefulWidget {
  final Quotes quote;
  final List<Quotes> quotes;
  final int index;

  QuoteCard({this.quote, this.quotes, this.index});

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5.0),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
              Radius.circular(20.0) //                 <--- border radius here
              ),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.grey[400],
              // offset: Offset(10, 10),
            ),
          ] // make rounded corner of border
          ),
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.quote.quoteText,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  widget.quote.quoteAuthor,
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
