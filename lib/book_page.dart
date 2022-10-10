
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_tres/book.dart';
import 'package:tarea_tres/book_provider.dart';

class BookPage extends StatelessWidget {
  
  final Book book;

  BookPage({
    required this.book
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.book.title),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.public_rounded)),
          IconButton(onPressed: (){
            BookProvider.shareBook(book);
          }, icon: Icon(Icons.share))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(this.book.image, height: 300),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: Text(this.book.title, style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),)
                ),
              ),
              Text("Author(s): " + this.book.author, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),),
              Align(child: Text(this.book.date, style: TextStyle(fontWeight: FontWeight.bold)), alignment: Alignment.centerLeft,),
              Align(child: Text("Pages: " + this.book.pages,), alignment: Alignment.centerLeft,),
              GestureDetector(
                onTap: (() {
                  context.read<BookProvider>().changeIsTextShortened(); 
                }),
                child: context.watch<BookProvider>().isTextShortened? 
                Text(this.book.description, textAlign: TextAlign.justify , style: TextStyle(fontStyle: FontStyle.italic), maxLines: 5, overflow: TextOverflow.ellipsis,) :
                Text(this.book.description, textAlign: TextAlign.justify , style: TextStyle(fontStyle: FontStyle.italic),),
              )
              
            ],
          ),
        )
      ),
    );
  }
}