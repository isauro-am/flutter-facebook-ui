class Publication {
  final User user;
  final String title;
  final DateTime createdAt;
  final String imageUrl;
  final int commentsCount;
  final int shareCount;
  final ReactionType currentUserReaction;

  Publication({
    required this.currentUserReaction,
    required this.user,
    required this.title,
    required this.createdAt,
    required this.imageUrl,
    required this.commentsCount,
    required this.shareCount,
  });
}

class User {
  final String avatar;
  final String username;

  User({
    required this.avatar,
    required this.username,
  });
}

enum ReactionType {
  angry,
  heart,
  laughing,
  like,
  sad,
  shocked,
}
