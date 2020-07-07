import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf/books.dart';
import 'package:bookshelf/Details.dart';

void main() => runApp(BookApp());

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'book shelf',
      home: BooksHome(),
    );
  }
}

class BooksHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              CustomTitleBar(),
              HorizontalListView(),
              HotList(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTitleBar extends StatefulWidget {
  @override
  _CustomTitleBarState createState() => _CustomTitleBarState();
}

class _CustomTitleBarState extends State<CustomTitleBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 35),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.book,
              size: 45.0,
              color: Colors.black,
            ),
            SizedBox(width: 15.0),
            Text(
              'book shelf',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Merriweather', //Adding of font is remaining
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xfff8f8f8), Colors.white]),
          border: Border(
            bottom: BorderSide(
              color: Color(0xfff0f0f0),
              width: 2.0,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: booklist.books.length,
                itemBuilder: (BuildContext context, int i) {
                  if (booklist.books[i].franchise) {
                    return Showcase(
                        wideImage: booklist.books[i].wideImage,
                        bookObject: booklist.books[i]);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(height: 25),
            Text(
              'BEST BOOKS',
              style: TextStyle(
                letterSpacing: 1.5,
                fontFamily: 'Merriweather',
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
            Divider(
              color: Colors.black54,
            ),
            Text(
              'More Similar Books',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Showcase extends StatelessWidget {
  const Showcase({
    @required this.wideImage,
    @required this.bookObject,
  });

  final String wideImage;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Details(bookObject)));
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(wideImage, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class HotList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xfff8f8f8), Colors.white],
          ),
          border: Border(
            bottom: BorderSide(
              color: Color(0xfff0f0f0),
              width: 2,
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'New Books Hot List',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Merriweather',
                ),
              ),
            ),
            Container(
              height: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: booklist.books.length,
                itemBuilder: (BuildContext context, int i) {
                  String title = booklist.books[i].title.length > 17
                      ? booklist.books[i].title.substring(0, 15) + "..."
                      : booklist.books[i].title;

                  if (booklist.books[i].franchise) {
                    return Container();
                  } else {
                    return ShowBooks(
                      bookCoverImg: booklist.books[i].cover,
                      bookObject: booklist.books[i],
                      title: title,
                      author: booklist.books[i].author,
                      price: booklist.books[i].price,
                      subtitle: booklist.books[i].summary,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowBooks extends StatelessWidget {
  const ShowBooks({
    @required this.bookCoverImg,
    @required this.subtitle,
    @required this.title,
    @required this.author,
    @required this.price,
    @required this.bookObject,
  });

  final String bookCoverImg;
  final String subtitle;
  final String title;
  final String author;
  final int price;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Details(bookObject)));
        },
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 220,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      bookCoverImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Merriweather',
                  ),
                  softWrap: true,
                ),
                SizedBox(height: 7),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Merriweather',
                  ),
                  softWrap: true,
                ),
                SizedBox(height: 12),
                Text(
                  "Rs $price",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
