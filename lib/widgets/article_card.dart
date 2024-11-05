import 'package:flutter/material.dart';
import '../screens/details_screen.dart';

class ArticleCard extends StatelessWidget {
  final dynamic article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // Print the article object for debugging
    debugPrint(article.toString());
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              title: article['title'] ?? 'Sample News Title',
              content: article['content'] ??
                  'Full content of the news article goes here.',
              imageUrl: article['urlToImage'] ??
                  'https://picsum.photos/seed/picsum/200/300',
              authorName: article['author'] ?? 'Unknown Author',
              publishDate: _formatPublishDate(article['publishedAt']),
              readingTime: '5',
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            // Sample Image Section
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/seed/picsum/200/300',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title'] ?? 'Sample News Title',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'This is a short description of the news article. It provides a quick overview of the main content and purpose of the article.',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPublishDate(String? publishedAt) {
    if (publishedAt == null) return 'Unknown Date';
    final DateTime dateTime = DateTime.parse(publishedAt);
    return '${dateTime.month} - ${dateTime.day} - ${dateTime.year}';
  }
}
