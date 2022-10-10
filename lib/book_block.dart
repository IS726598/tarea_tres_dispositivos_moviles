import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_tres/book.dart';
import 'package:tarea_tres/book_page.dart';
import 'package:tarea_tres/book_provider.dart';

class BookBlock extends StatelessWidget {

  final Book book;

  BookBlock({
    required this.book
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        child: Column(
          children: [
            Image.network(this.book.image, height: 100,),
            Text(this.book.title, 
              overflow: TextOverflow.ellipsis, 
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      onTap: () {
        context.read<BookProvider>().isTextShortened = true;
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => BookPage(book: book))));
      },
    );
  }
}