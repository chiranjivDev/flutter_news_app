import 'package:flutter/material.dart';
import '../widgets/article_card.dart';

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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ArticleCard();
              },
            ),
          ) // Category selection bar
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
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
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
