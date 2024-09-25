import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:show_time/riverpod/get_show_data.dart';



class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showsAsyncValue = ref.watch(getShowsProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text('Shows List'),
      ),
      body: showsAsyncValue.when(
        data: (shows) {
          return ListView.builder(
            itemCount: shows.length,
            itemBuilder: (context, index) {
              final showResponse = shows[index];
              final show = showResponse.show;

              // Ensure show is not null before accessing its properties
              return ListTile(
                title: Text(show?.name ?? 'Unknown Show'),
                subtitle: Text(show?.summary ?? 'No Summary Available'),
                leading: show?.image?.medium != null
                    ? Image.network(show!.image!.medium) // Ensure image is not null
                    : null,
                onTap: () {
                  // Add navigation or other actions here if needed
                },
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Search Screen"),
//       ),
//
//     );
//   }
// }
