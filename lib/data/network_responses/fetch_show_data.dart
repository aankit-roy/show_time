import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:show_time/data/model/show_response.dart';

Future<List<ShowResponse>> fetchShowsData() async {
  final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    // Print the raw JSON response for debugging

    return jsonResponse.map((show) => ShowResponse.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}