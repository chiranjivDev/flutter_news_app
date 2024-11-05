import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final String authorName;
  final String publishDate;
  final String readingTime;

  const DetailsScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.authorName,
    required this.publishDate,
    required this.readingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the image at the top
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image:
                      NetworkImage(imageUrl), // Load the image from the network
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Row for title and action buttons
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'By $authorName | $publishDate',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Estimated reading time: $readingTime minutes',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16.0),

            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 16.0),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // Widget to create action buttons (like and share icons)
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround, // Evenly distribute icons
      children: [
        IconButton(
          icon: const Icon(Icons.thumb_up), // Like icon
          onPressed: () {
            // Handle like action
            print('Liked!');
          },
          tooltip: 'Like',
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_border),
          onPressed: () {
            // Logic to bookmark the article
            print('Bookmarked!');
          },
        ),
        IconButton(
          icon: const Icon(Icons.share), // Share icon
          onPressed: () {
            // Handle share action
            print('Shared!');
          },
          tooltip: 'Share',
        ),
      ],
    );
  }
}
