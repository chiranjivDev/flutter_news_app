import 'package:flutter/material.dart';
import '../widgets/article_card.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample categories
  final List<String> _categories = [
    'Technology',
    'Business',
    'Sports',
    'Health'
  ];
  int _selectedCategoryIndex = 0;
  late Future<List<dynamic>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles(); // Initial fetch on load
  }

  Future<List<dynamic>> fetchArticles() async {
    final category = _categories[_selectedCategoryIndex].toLowerCase();
    return await NewsService().fetchTopHeadlines(category);
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      futureArticles =
          fetchArticles(); // Fetch articles for the selected category
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Column(
        children: [
          _buildCategoryBar(),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: futureArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No articles available.'));
                } else {
                  // Display the articles
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final article = snapshot.data![index];
                      return ArticleCard(article: article);
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // Category Selection Bar
  Widget _buildCategoryBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onCategorySelected(index),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _selectedCategoryIndex == index
                    ? Colors.blue
                    : Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
