import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutterImage;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/data/model/show_response.dart';
import 'package:show_time/res/constants/app_color.dart';

class DetailsScreen extends StatelessWidget {
  final Show show; // Accepting the Show object

  const DetailsScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    // final imageUrl = show.image?.medium ??
    //     ''; // Get the image URL or use an empty string if null
    final showName =
        show.name ?? 'Unknown Show'; // Get the show name or a fallback
    String imageUrl = show.image?.original ?? ''; // Use original image URL
    print('Image URL: $imageUrl'); // Debugging line to see the URL

    if (imageUrl.isEmpty) {
      imageUrl = 'https://cdn.pixabay.com/photo/2022/08/17/21/00/dragons-7393467_1280.jpg'; // Fallback for empty URLs
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                iconTheme: const IconThemeData(color: AppColors.white),
                expandedHeight: 450.h,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: AppBarBackground(imageUrl, showName),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: DetailColumn(),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  Column DetailColumn() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        show.summary != null
                            ? show.summary!.replaceAll(RegExp(r'<[^>]*>'),
                                '') // Remove HTML tags from the summary
                            : 'No Summary Available',
                        style: TextStyle(
                            color: Colors.grey, height: 1.4, fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      const Text(
                        "Genres",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        show.genres?.join(', ') ?? 'No Genres',
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Language",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${show.language}",
                        style:   TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),



                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  );
  }

  Container AppBarBackground(String imageUrl, String showName) {
    return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(.3),
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            showName,
                            style: TextStyle(
                              fontSize: 50.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "${show.status ?? 'Unknown'}",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                  "Runtime: ${show.runtime != null ? '${show.runtime} min' : 'N/A'}",
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
  }


}
// return Scaffold(
//   appBar: AppBar(
//     title: Text(show.name ?? 'Show Details',style: TextStyle(color: AppColors.white),),
//     iconTheme: const IconThemeData(
//       color: Colors.white, // Set your desired color here
//     ),
//
//     backgroundColor: AppColors.backgroundBlack,
//   ),
//   body: Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Show Image
//
//
//         const SizedBox(height: 16),
//
//         // Show Title
//         Text(
//           show.name ?? 'Unknown Show',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//
//         const SizedBox(height: 8),
//
//         // Show Genres
//         Text('Genres: ${show.genres?.join(', ') ?? 'N/A'}'),
//
//         const SizedBox(height: 8),
//
//         // Show Language
//         Text('Language: ${show.language ?? 'Unknown'}'),
//
//         const SizedBox(height: 8),
//
//         // Show Status
//         Text('Status: ${show.status ?? 'Unknown'}'),
//
//         const SizedBox(height: 16),
//
//         // Show Summary
//         Text(
//           show.summary != null
//               ? show.summary!.replaceAll(RegExp(r'<[^>]*>'),
//                   '') // Remove HTML tags from the summary
//               : 'No Summary Available',
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     ),
//   ),
// );
