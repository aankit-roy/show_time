// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:show_time/res/constants/app_color.dart';
// import 'package:show_time/riverpod/get_show_data.dart';
// //
// //
// //
// // class SearchScreen extends ConsumerWidget {
// //   const SearchScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final showsAsyncValue = ref.watch(getShowsProvider);
// //
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Shows List'),
// //       ),
// //       body: showsAsyncValue.when(
// //         data: (shows) {
// //           return ListView.builder(
// //             itemCount: shows.length,
// //             itemBuilder: (context, index) {
// //               final showResponse = shows[index];
// //               final show = showResponse.show;
// //
// //               // Ensure show is not null before accessing its properties
// //               return ListTile(
// //                 title: Text(show?.name ?? 'Unknown Show'),
// //                 subtitle: Text(show?.summary ?? 'No Summary Available'),
// //                 leading: show?.image?.medium != null
// //                     ? Image.network(show!.image!.medium) // Ensure image is not null
// //                     : null,
// //                 onTap: () {
// //                   // Add navigation or other actions here if needed
// //                 },
// //               );
// //             },
// //           );
// //         },
// //         loading: () => Center(child: CircularProgressIndicator()),
// //         error: (error, stack) => Center(child: Text('Error: $error')),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:show_time/screens/detail_screen.dart';
//
// class SearchScreen extends ConsumerWidget {
//   const SearchScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Get the filtered shows from the search provider
//     final filteredShows = ref.watch(searchProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.backgroundBlack,
//         title: Text(
//           "Top Search",
//           style: TextStyle(color: AppColors.white),
//         ),
//         iconTheme: IconThemeData(
//           color: AppColors.white,
//         ),
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               height: 50.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: TextField(
//                 onChanged: (query) {
//                   ref.read(searchProvider.notifier).searchShows(query);
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search here...",
//
//                   fillColor: Colors.grey
//                       .shade500, // Change this to your desired background color
//                   filled: true, // Enable filling
//                   border: InputBorder.none,
//
//                   suffixIcon:
//                       Icon(Icons.search, color: Colors.grey), // Add search icon
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredShows.length,
//               itemBuilder: (context, index) {
//                 final show = filteredShows[index];
//                 final imageUrl = show?.image?.medium ?? ''; //
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           width: 80.w, // Width of each container
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(16), // Rounded corners
//
//
//                           ),
//                           child:  Image.network(imageUrl),
//                         ),
//                       ),
//                       Text(show.name ?? 'No Title',style: TextStyle(color: AppColors.white,fontSize: 26.sp,fontWeight: FontWeight.w700),),
//                       Icon(Icons.play_circle,size: 50,color: AppColors.white,)
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/data/model/show_response.dart';
import 'package:show_time/res/constants/app_color.dart';
import 'package:show_time/riverpod/get_show_data.dart';
import 'package:show_time/screens/detail_screen.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the filtered shows from the search provider
    final filteredShows = ref.watch(searchProvider);
    final showsAsyncValue = ref.watch(getShowsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlack,
        title: Text(
          "Top Search",
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          SearchBox(ref),


          // Display shows list
          SearchListMovies(showsAsyncValue, filteredShows),


        ],
      ),
    );
  }

  Expanded SearchListMovies(AsyncValue<List<ShowResponse>> showsAsyncValue, List<Show> filteredShows) {
    return Expanded(
          child: showsAsyncValue.when(
            data: (allShows) {
              final shows = filteredShows.isEmpty
                  ? allShows.map((showResponse) => showResponse.show).toList()
                  : filteredShows; // Show original list by default or filtered list

              return ListView.builder(
                itemCount: shows.length,
                itemBuilder: (context, index) {
                  final show = shows[index];
                  final imageUrl = show?.image?.medium ?? ''; // Get the image URL

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80.w, // Width of the image container
                            height: 100.h, // Height of the image container
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16), // Rounded corners for image
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: Text(
                            show?.name ?? 'No Title',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(Icons.play_circle, size: 50, color: AppColors.white),
                      ],
                    ),
                  );
                },
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        );
  }

  Padding SearchBox(WidgetRef ref) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10), // Rounded corners for search bar
              color:
                  Colors.grey.shade500, // Background color for the search bar
            ),
            child: TextField(
              onChanged: (query) {
                ref.read(searchProvider.notifier).searchShows(query);
              },
              decoration: InputDecoration(
                hintText: "Search here...",
                fillColor: Colors.transparent, // Transparent fill
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded border
                  borderSide: BorderSide.none, // No border
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                suffixIcon:
                    Icon(Icons.search, color: Colors.white), // Search icon
              ),
            ),
          ),
        );
  }
}
