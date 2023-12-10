

class Comment {
  final String userId;
  String userName;
  String userProfilePicture;
  String text;
  DateTime timestamp;

  Comment({
    required this.userId,
    required this.userName,
    required this.userProfilePicture,
    required this.text,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "userProfilePicture": userProfilePicture,
        "text": text,
        "timestamp": timestamp.toUtc().toIso8601String(),
      };

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userProfilePicture: json['userProfilePicture'] ?? '',
      text: json['text'] ?? '',
      timestamp: DateTime.parse(json['timestamp'] ?? ''),
    );
  }
}

class Post {
  String userName;
  String userProfilePicture;
  String textContent;
  List<String> images;
  DateTime timestamp;
  int likes;
  int commentCount;
  List<Comment> comments;

  Post({
    required this.userName,
    required this.userProfilePicture,
    required this.textContent,
    required this.images,
    required this.timestamp,
    this.likes = 0,
    this.commentCount = 0,
    this.comments = const [],
  });

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userProfilePicture": userProfilePicture,
        "textContent": textContent,
        "images": images,
        "timestamp": timestamp.toUtc().toIso8601String(),
        "likes": likes,
        "commentCount": commentCount,
        "comments": comments.map((comment) => comment.toJson()).toList(),
      };

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userName: json['userName'] ?? '',
      userProfilePicture: json['userProfilePicture'] ?? '',
      textContent: json['textContent'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      timestamp: DateTime.parse(json['timestamp'] ?? ''),
      likes: json['likes'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((commentJson) => Comment.fromJson(commentJson))
              .toList() ??
          [],
    );
  }
}
