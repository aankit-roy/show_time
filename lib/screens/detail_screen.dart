import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/data/model/show_response.dart';
import 'package:show_time/res/constants/app_color.dart';

class DetailsScreen extends StatelessWidget {
  final Show show; // Accepting the Show object

  const DetailsScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    final imageUrl = show?.image?.medium ??
        ''; // Get the image URL or use an empty string if null
    final showName = show?.name ?? 'Unknown Show'; // Get the show name or a fallback

    return Scaffold(
      appBar: AppBar(
        title: Text(show.name ?? 'Show Details',style: TextStyle(color: AppColors.white),),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set your desired color here
        ),

        backgroundColor: AppColors.backgroundBlack,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show Image


            const SizedBox(height: 16),

            // Show Title
            Text(
              show.name ?? 'Unknown Show',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Show Genres
            Text('Genres: ${show.genres?.join(', ') ?? 'N/A'}'),

            const SizedBox(height: 8),

            // Show Language
            Text('Language: ${show.language ?? 'Unknown'}'),

            const SizedBox(height: 8),

            // Show Status
            Text('Status: ${show.status ?? 'Unknown'}'),

            const SizedBox(height: 16),

            // Show Summary
            Text(
              show.summary != null
                  ? show.summary!.replaceAll(RegExp(r'<[^>]*>'),
                      '') // Remove HTML tags from the summary
                  : 'No Summary Available',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
