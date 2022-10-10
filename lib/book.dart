class Book {

  final String title;
  final String date;
  final String description;
  final String author;
  final String image;
  final String pages;

  Book({
    required this.title,
    required this.date,
    required this.description,
    required this.author,
    required this.image,
    required this.pages
  });

  factory Book.fromJson(Map<String, dynamic> json)
  {
    String title = json["volumeInfo"]["title"];
    String date = json["volumeInfo"]["publishedDate"];
    String description = json["volumeInfo"]["description"] == null? "-" :  json["volumeInfo"]["description"];
    String author = "";

    print(json);
    int i = 0;

    if(json["volumeInfo"]["authors"] != null) {
      for(i = 0; i < json["volumeInfo"]["authors"].length - 1; i++)
      {
        author += json["volumeInfo"]["authors"][i] + ", ";
      }
      author += json["volumeInfo"]["authors"][i];
    } else {
      author = "-";
    }

    String image = "https://cdn-icons-png.flaticon.com/512/151/151896.png";
    try {
      image = json["volumeInfo"]["imageLinks"]["thumbnail"];
    } catch(error) {
      image = "https://cdn-icons-png.flaticon.com/512/151/151896.png";
    }

    String pages = "";
    if(json["volumeInfo"]["pageCount"] == null) {
      pages = "-";
    } else {
      pages = json["volumeInfo"]["pageCount"].toString();
    }  
    
    return Book(title: title, date: date, description: description, author: author, image: image, pages: pages);

  }

}

