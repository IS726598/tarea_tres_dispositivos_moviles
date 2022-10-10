import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tarea_tres/book.dart';


class HttpHandler {


  final String url = "https://www.googleapis.com/books/v1/volumes?q=";
  

  HttpHandler._internal();
  static final HttpHandler _httpHandler = HttpHandler._internal();  

  factory HttpHandler() {
    return _httpHandler;
  }

  Future<List> findBooks(String searchTerm) async {
       
    var request = await http.get(
      Uri.parse(this.url + searchTerm),      
    );

    print(request.body);

    if(request.statusCode == 200)
    {        
      Map<String, dynamic> bookListJson = jsonDecode(request.body);      

      if(bookListJson["items"] == null) {
        return [];
      }    

      List bookList = [];
      for(int i = 0; i < bookListJson["items"].length; i++)
      {
        bookList.add(Book.fromJson(bookListJson["items"][i]));
      }

      return bookList;
    }
    
    throw Exception("Something went wrong");

    }  
  

}