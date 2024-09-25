import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:show_time/riverpod/get_show_data.dart';
//
//
//
// class SearchScreen extends ConsumerWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final showsAsyncValue = ref.watch(getShowsProvider);
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shows List'),
//       ),
//       body: showsAsyncValue.when(
//         data: (shows) {
//           return ListView.builder(
//             itemCount: shows.length,
//             itemBuilder: (context, index) {
//               final showResponse = shows[index];
//               final show = showResponse.show;
//
//               // Ensure show is not null before accessing its properties
//               return ListTile(
//                 title: Text(show?.name ?? 'Unknown Show'),
//                 subtitle: Text(show?.summary ?? 'No Summary Available'),
//                 leading: show?.image?.medium != null
//                     ? Image.network(show!.image!.medium) // Ensure image is not null
//                     : null,
//                 onTap: () {
//                   // Add navigation or other actions here if needed
//                 },
//               );
//             },
//           );
//         },
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('Error: $error')),
//       ),
//     );
//   }
// }



import 'package:show_time/screens/detail_screen.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the filtered shows from the search provider
    final filteredShows = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Shows'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                ref.read(searchProvider.notifier).searchShows(query);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Top Searches Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Top Searches',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // ListView of filtered shows
          Expanded(
            child: ListView.builder(
              itemCount: filteredShows.length,
              itemBuilder: (context, index) {
                final show = filteredShows[index];
                return ListTile(
                  title: Text(show.name ?? 'No Title'),
                  onTap: () {
                    // Navigate to details screen or perform an action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(show: show),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}