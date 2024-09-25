import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:show_time/data/model/show_response.dart';
import 'package:show_time/data/network_responses/fetch_show_data.dart';



final getShowsProvider = FutureProvider<List<ShowResponse>>((ref) async {
  return await fetchShowsData(); // Use your existing fetch function
});