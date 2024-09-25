// class ShowResponse {
//   final double ? score;
//   final Show ? show;
//
//   ShowResponse({required this.score, required this.show});
//
//   factory ShowResponse.fromJson(Map<String, dynamic> json) {
//     return ShowResponse(
//       score: json['score'].toDouble(),
//       show: Show.fromJson(json['show']),
//     );
//   }
// }
//
// class Show {
//   final int ?id;
//   final String? url;
//   final String? name;
//   final String? language;
//   final List<String>? genres;
//   final String? status;
//   final String? summary;
//   final Image ? image;
//
//   Show({
//     required this.id,
//     required this.url,
//     required this.name,
//     required this.language,
//     required this.genres,
//     required this.status,
//     required this.summary,
//     required this.image,
//   });
//
//   factory Show.fromJson(Map<String, dynamic> json) {
//     return Show(
//       id: json['id'],
//       url: json['url'],
//       name: json['name'],
//       language: json['language'],
//       genres: List<String>.from(json['genres']),
//       status: json['status'],
//       summary: json['summary'],
//       image: Image.fromJson(json['image']),
//     );
//   }
// }
//
// class Image {
//   final String medium;
//   final String original;
//
//   Image({required this.medium, required this.original});
//
//   factory Image.fromJson(Map<String, dynamic> json) {
//     return Image(
//       medium: json['medium'],
//       original: json['original'],
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

  Show({
    this.id,
    this.url,
    this.name,
    this.language,
    this.genres,
    this.status,
    this.summary,
    this.image,
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