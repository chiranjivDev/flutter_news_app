import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String _apiKey = '37f57f1b185c448895e60d82bf76639a';
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<List<dynamic>> fetchTopHeadlines(String category) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/top-headlines?category=$category&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API response: ${data['articles']}');
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
