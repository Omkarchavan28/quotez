import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotez/models/quotes.dart';
import 'package:quotez/src/quote_card.dart';
import 'package:quotez/src/swipe_actions.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quotes> quotes = const [];
  Future loadQuoteList() async {
    String content = await rootBundle.loadString('quotes/quotes.json');
    List collectionQuotes = json.decode(content);
    List<Quotes> _quotes =
        collectionQuotes.map((json) => Quotes.fromJson(json)).toList();
    setState(() {
      quotes = _quotes;
    });
    // print(quotes);
  }

  void initState() {
    loadQuoteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Quotez',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFF34495E),
            fontSize: 40.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.format_list_bulleted,
            size: 40.0,
            color: Color(0xFF34495E),
          ),
        ],
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            color: Colors.lightBlue[100],
            child: Center(
              child: Text(
                'Quotes of the Day',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 50.0,
                  letterSpacing: 2,
                  color: Color(0xFF34495E),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, // use this
              itemCount: quotes.length,
              itemBuilder: (BuildContext context, int index) {
                Quotes quote = quotes[index];
                return Dismissible(
                  child: QuoteCard(
                    quote: quote,
                  ),
                  key: ObjectKey(quotes[index]),
                  onDismissed: (direction) {
                    setState(() {
                      quotes.remove(quote);
                    });
                  },
                  background: RightSwipeBackGround(),
                  secondaryBackground: LeftSwipeBackGround(),
                  // confirmDismiss: (direction) async {
                  //   if (direction == DismissDirection.endToStart) {
                  //     final bool res = await showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             content: Text(
                  //                 "Are you sure you want to delete ${quotes[index]}?"),
                  //             actions: <Widget>[
                  //               FlatButton(
                  //                 child: Text(
                  //                   "Cancel",
                  //                   style: TextStyle(color: Colors.black),
                  //                 ),
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //               ),
                  //               FlatButton(
                  //                 child: Text(
                  //                   "Delete",
                  //                   style: TextStyle(color: Colors.red),
                  //                 ),
                  //                 onPressed: () {
                  //                   // TODo: Delete the item from DB etc..
                  //                   setState(() {
                  //                     quotes.removeAt(index);
                  //                   });
                  //                   Navigator.of(context).pop();
                  //                 },
                  //               ),
                  //             ],
                  //           );
                  //         });
                  //     return res;
                  //   } else {
                  //     // TODo: Navigate to edit page;
                  //   }
                  // },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
