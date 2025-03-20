// lib/book_list.dart
import 'package:flutter/material.dart';
import 'book.dart';
import 'add_book_screen.dart';
import 'book_detail_screen.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<Book> books = [];

  void _addBook(String title, String author) {
    setState(() {
      books.add(Book(title: title, author: author));
    });
  }

  void _navigateToAddBookScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBookScreen(),
      ),
    );

    if (result != null) {
      _addBook(result['title'], result['author']);
    }
  }

  void _navigateToBookDetailScreen(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Management App'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () => _navigateToBookDetailScreen(context, book),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddBookScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
