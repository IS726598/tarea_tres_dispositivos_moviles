
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tarea_tres/book.dart';
import 'package:tarea_tres/book_block.dart';
import 'package:tarea_tres/book_provider.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class HomePage extends StatelessWidget {

  final TextEditingController searchTerm = TextEditingController();


  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free to Play Library'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: TextField( 
                  
                  controller: searchTerm,        
                  decoration: InputDecoration(  
                    contentPadding: EdgeInsets.all(8),                
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "Write a search term",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (() {
                        print(searchTerm.text);
                        context.read<BookProvider>().findBooks(searchTerm.text);
                      }),
                    )                                    
                  ),                
                ),
              ),
              Expanded(
                child: context.watch<BookProvider>().isCurrentlySearching? 
                Container(                  
                      child: GridView.count(
                        primary: false,                
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 32, right: 32),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        children: List.generate(6, ((index) => PlayStoreShimmer()))
                        ,
                      ),
                    )
                    :
                context.watch<BookProvider>().bookList.length == 0? 
                  Center(child: Text(context.watch<BookProvider>().hasFirstSearchOcurred? 
                        "No results" : 
                        context.watch<BookProvider>().hasSearchErrorOccurred? 
                            "Something went wrong. Try searching again":
                            "Enter a phrase to search for related books",
                   style: TextStyle(color: Colors.grey),)) :                   
                    Container(                  
                      child: GridView.count(
                        primary: false,                
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(context.watch<BookProvider>().bookList.length, (index) => BookBlock(book: context.watch<BookProvider>().bookList[index]))
                        ,
                      ),
                    ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
