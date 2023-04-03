import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/publication.dart';

class PublicationItem extends StatelessWidget {
  const PublicationItem({
    Key? key,
    required this.publication,
  }) : super(key: key);

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    const reactions = ReactionType.values;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(publication.user.avatar),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        publication.user.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        timeago.format(publication.createdAt),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  publication.imageUrl,
                ),
              ),
            ),

            // Disabling for now, because it's not working on Linux Emulator

            // CachedNetworkImage(
            //   height: 180,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            //   imageUrl: publication.imageUrl,
            //   // placeholder: (context, url) => const Center(
            //   //   child: CircularProgressIndicator(),
            //   // ),
            //   // errorWidget: (context, url, error) => const Icon(Icons.error),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(publication.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  for (var reaction in reactions)
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/emojis/${reaction.toString().split('.').last}.svg',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          (publication.currentUserReaction == reaction)
                              ? const Icon(Icons.circle,
                                  color: Colors.blue, size: 5)
                              : const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  const Spacer(),
                  Text(
                    '${formatCount(publication.commentsCount)} Comments',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${formatCount(publication.shareCount)} Shares',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return PublicationItem(publication: publication);
  }
}

/// If the count is less than 1000, return the count as a string. Otherwise, if the count is less than
/// 1,000,000, return the count divided by 1000, rounded to one decimal place, and appended with a K.
/// Otherwise, return the count divided by 1,000,000, rounded to one decimal place, and appended with an
/// M
///
/// Args:
///   count (int): The number to be formatted.
///
/// Returns:
///   A string.
String formatCount(int count) {
  if (count < 1001) {
    return count.toString();
  } else if (count < 1000000) {
    return '${(count / 1000).toStringAsFixed(1)}K';
  } else {
    return '${(count / 1000000).toStringAsFixed(1)}M';
  }
}
