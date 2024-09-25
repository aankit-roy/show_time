
//
// class ShowResponse {
//   final double? score; // Nullable
//   final Show? show; // Nullable
//
//   ShowResponse({this.score, this.show}); // Make required fields optional
//
//   factory ShowResponse.fromJson(Map<String, dynamic> json) {
//     return ShowResponse(
//       score: json['score']?.toDouble(), // Handle null with the null-aware operator
//       show: json['show'] != null ? Show.fromJson(json['show']) : null, // Check for null
//     );
//   }
// }
//
// class Show {
//   final int? id; // Nullable
//   final String? url; // Nullable
//   final String? name; // Nullable
//   final String? language; // Nullable
//   final List<String>? genres; // Nullable
//   final String? status; // Nullable
//   final String? summary; // Nullable
//   final ShowImage? image; // Change from Image to ShowImage
//
//   Show({
//     this.id,
//     this.url,
//     this.name,
//     this.language,
//     this.genres,
//     this.status,
//     this.summary,
//     this.image,
//   });
//
//   factory Show.fromJson(Map<String, dynamic> json) {
//     return Show(
//       id: json['id'],
//       url: json['url'],
//       name: json['name'],
//       language: json['language'],
//       genres: json['genres'] != null ? List<String>.from(json['genres']) : [], // Handle null
//       status: json['status'],
//       summary: json['summary'],
//       image: json['image'] != null ? ShowImage.fromJson(json['image']) : null, // Use ShowImage instead of Image
//     );
//   }
// }
//
// class ShowImage { // Changed from Image to ShowImage
//   final String medium; // Required
//   final String original; // Required
//
//   ShowImage({required this.medium, required this.original});
//
//   factory ShowImage.fromJson(Map<String, dynamic> json) {
//     return ShowImage(
//       medium: json['medium'] ?? '', // Provide default value if null
//       original: json['original'] ?? '', // Provide default value if null
//     );
//   }
// }


class ShowResponse {
  final double? score; // Nullable
  final Show? show; // Nullable

  ShowResponse({this.score, this.show}); // Make required fields optional

  factory ShowResponse.fromJson(Map<String, dynamic> json) {
    return ShowResponse(
      score: json['score']?.toDouble(), // Handle null with the null-aware operator
      show: json['show'] != null ? Show.fromJson(json['show']) : null, // Check for null
    );
  }
}

class Show {
  final int? id; // Nullable
  final String? url; // Nullable
  final String? name; // Nullable
  final String? language; // Nullable
  final List<String>? genres; // Nullable
  final String? status; // Nullable
  final String? summary; // Nullable
  final Image? image; // Nullable
  final int? runtime; // Added runtime (in minutes)

  Show({
    this.id,
    this.url,
    this.name,
    this.language,
    this.genres,
    this.status,
    this.summary,
    this.image,
    this.runtime,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      language: json['language'],
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [], // Handle null
      status: json['status'],
      summary: json['summary'],
      image: json['image'] != null ? Image.fromJson(json['image']) : null, // Check for null
      runtime: json['runtime'],
    );
  }
}

class Image {
  final String medium; // Required
  final String original; // Required

  Image({required this.medium, required this.original});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json['medium'] ?? '', // Provide default value if null
      original: json['original'] ?? '', // Provide default value if null
    );
  }
}