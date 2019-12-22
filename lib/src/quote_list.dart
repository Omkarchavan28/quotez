import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotez/models/quotes.dart';
import 'package:quotez/src/quote_card.dart';
import 'package:quotez/src/swipe_actions.dart';

class QuoteList extends StatefulWidget {
  const QuoteList({
    Key key,
  }) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quotes> quotes = const [];
  Future loadQuoteList() async {
    String content = await rootBundle.loadString('assets/quotes.json');
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
    return Stack(
      children: <Widget>[
        Container(
          // margin: EdgeInsets.only(top: 25),
          height: 200.0,
          color: Colors.lightBlueAccent,
        ),
        ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true, // use this
          itemCount: quotes.length,
          itemBuilder: _mainListBuilder,
        ),
      ],
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(bottom: 5),
      height: 230.0,
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
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0) return _buildHeader(context);
    Quotes quote = quotes[index - 1];
    return Container(
      color: Colors.white,
      child: Dismissible(
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
      ),
    );
  }
}
