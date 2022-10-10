import 'package:flutter/cupertino.dart';
import 'package:tarea_tres/book.dart';
import 'package:tarea_tres/http_handler.dart';
import 'package:share_plus/share_plus.dart';

class BookProvider with ChangeNotifier {

  List bookList = [];
  final httpHandler = HttpHandler();  
  bool hasFirstSearchOcurred = false; 
  bool hasSearchErrorOccurred = false;
  bool isCurrentlySearching = false; 
  bool isTextShortened = true;

  void changeIsTextShortened()
  {
    this.isTextShortened = !this.isTextShortened;
    notifyListeners();
  }

  void findBooks(String searchTerm) async

  {
    if(searchTerm != "")
    {
      hasSearchErrorOccurred = false;
      isCurrentlySearching = true;
      this.notifyListeners();
      try {
        this.bookList = await httpHandler.findBooks(searchTerm);
      } catch (error) {
        this.hasSearchErrorOccurred = true;
      }
      hasFirstSearchOcurred = true;
      isCurrentlySearching = false;
      this.notifyListeners();
    }
  }

  static void shareBook(Book book)  
  {
    Share.share(book.title + "\nPages: " + book.pages);
  }

}