import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:show_time/data/model/show_response.dart';
import 'package:show_time/data/network_responses/fetch_show_data.dart';



final getShowsProvider = FutureProvider<List<ShowResponse>>((ref) async {
  return await fetchShowsData(); // Use your existing fetch function
});

final searchProvider = StateNotifierProvider<SearchNotifier, List<Show>>((ref) {
  return SearchNotifier(ref); // Pass the ref
});

// class SearchNotifier extends StateNotifier<List<Show>> {
//   final Ref ref;
//
//   SearchNotifier(this.ref) : super([]);
//
//   void searchShows(String query) {
//     // Access the current state of the FutureProvider
//     final asyncShows = ref.read(getShowsProvider);
//
//     // Check if asyncShows is in the correct state
//     if (asyncShows is AsyncData<List<ShowResponse>>) {
//       final allShows = asyncShows.value ?? [];
//
//       if (query.isEmpty) {
//         state = allShows.map((showResponse) => showResponse.show).toList(); // Convert to Show
//       } else {
//         state = allShows
//             .map((showResponse) => showResponse.show)
//             .where((show) => show?.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
//             .toList();
//       }
//     }
//   }
// }

class SearchNotifier extends StateNotifier<List<Show>> {
  final Ref ref;

  SearchNotifier(this.ref) : super([]);

  void searchShows(String query) {
    // Access the current state of the FutureProvider
    final asyncShows = ref.read(getShowsProvider);

    // Check if asyncShows is in the correct state
    if (asyncShows is AsyncData<List<ShowResponse>>) {
      final allShows = asyncShows.value ?? [];

      if (query.isEmpty) {
        state = allShows
            .map((showResponse) => showResponse.show) // This returns List<Show?>
            .where((show) => show != null) // Filter out null values
            .cast<Show>() // Cast to List<Show>
            .toList(); // Convert to List<Show>
      } else {
        state = allShows
            .map((showResponse) => showResponse.show)
            .where((show) => show != null && show.name!.toLowerCase().contains(query.toLowerCase()) ?? false) // Ensure show is not null
            .cast<Show>() // Cast to List<Show>
            .toList();
      }
    }
  }
}


// class SearchNotifier extends StateNotifier<List<Show>> {
//   final ProviderReference ref; // Use ProviderReference instead of Reader
//
//   SearchNotifier(this.ref) : super([]);
//
//   void searchShows(String query) {
//     final allShows = ref.read(getShowsProvider); // Access all shows using ref
//     if (query.isEmpty) {
//       state = allShows; // Reset to all shows if query is empty
//     } else {
//       state = allShows.where((show) =>
//       show.name?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
//     }
//   }
// }