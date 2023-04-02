import 'package:flutter/material.dart';

import '../../models/story.dart';
import 'avatar.dart';

final stories = [
  Story(
      background: 'assets/wallpapers/1.jpeg',
      avatar: 'assets/users/1.jpg',
      username: 'John Doe'),
  Story(
      background: 'assets/wallpapers/2.jpeg',
      avatar: 'assets/users/2.jpg',
      username: 'Eva Smith'),
  Story(
      background: 'assets/wallpapers/3.jpeg',
      avatar: 'assets/users/3.jpg',
      username: 'Robert Downey'),
  Story(
      background: 'assets/wallpapers/4.jpeg',
      avatar: 'assets/users/4.jpg',
      username: 'Kristen Stewart'),
  Story(
      background: 'assets/wallpapers/5.jpeg',
      avatar: 'assets/users/5.jpg',
      username: 'Olivia Wilde'),
  Story(
      background: 'assets/wallpapers/6.jpeg',
      avatar: 'assets/users/6.jpg',
      username: 'Lily Collins'),
  Story(
      background: 'assets/wallpapers/4.jpeg',
      avatar: 'assets/users/7.jpg',
      username: 'Emma Watson'),
  Story(
      background: 'assets/wallpapers/2.jpeg',
      avatar: 'assets/users/8.jpg',
      username: 'Scarlett Johansson'),
];

class UserStories extends StatelessWidget {
  const UserStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double storyHeight = 160;

    return SizedBox(
      height: storyHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final story = stories[index];

          return StoryItem(
              storyHeight: storyHeight, story: story, index: index);
        },
        itemCount: stories.length,
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.storyHeight,
    required this.story,
    required this.index,
  });

  final double storyHeight;
  final Story story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
        top: 15,
      ),
      padding: EdgeInsets.only(
        left: (index == 0) ? 10 : 0,
      ),
      height: storyHeight,
      width: 90,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(story.background),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Avatar(
                      size: 40,
                      asset: story.avatar,
                      borderSize: 3,
                    )),
              ],
            ),
          ),
          Text(
            story.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
