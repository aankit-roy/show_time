import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/riverpod/get_show_data.dart';
import 'package:show_time/screens/detail_screen.dart';

class MovieContainerCard extends ConsumerWidget{
  const MovieContainerCard({
    super.key,

  });




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieData = ref.watch(getShowsProvider);
    return movieData.when(data: (movies){
      return SizedBox(
        height: 180.h, // Adjusted height for container
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final show = movies[index].show; // Get the show data
            final imageUrl = show?.image?.medium ?? ''; // Get the image URL or use an empty string if null
            final showName = show?.name ?? 'Unknown Show'; // Get the show name or a fallback

            return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(show: show!),
                    ),
                  );
                },
                child: Container(
                  width: 130.w, // Width of each container
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    // Removed boxShadow
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft, // Start from the bottom left
                      end: Alignment.topRight, // End at the top right
                      colors: [
                        Colors.black, // Black color at the bottom left
                        Colors.transparent, // Transparent at the top right
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Image Section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Rounded corners
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity, // Ensure image fills the container
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                        ),
                      ),

                      // Title with Gradient Background on top of the Image
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,

                              colors: [
                                Colors.black.withOpacity(.9),
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                                Colors.black.withOpacity(.1),

                              ]
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                showName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),

                                maxLines: 2, // Restrict title to one line
                                overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                              ),
                              // Text(
                              //    showName,
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w700,
                              //     fontSize: 12.sp,
                              //     color: Colors.white,
                              //   ),
                              //
                              //   maxLines: 1, // Restrict title to one line
                              //   overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          },
        ),
      );
    }, error: (error, stack) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));
  }

}