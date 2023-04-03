import 'package:facebook_ui/icons/icons.dart';
import 'package:facebook_ui/models/publication.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/circle_button.dart';
import 'widgets/publication_item.dart';
import 'widgets/quick_actions.dart';
import 'widgets/stories.dart';
import 'widgets/whats_mind.dart';

class FacebookUi extends StatelessWidget {
  const FacebookUi({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();

    final publications = <Publication>[];

    for (var i = 0; i < 10; i++) {
      final publication = Publication(
        user: User(
          username: faker.person.name(),
          avatar: faker.image.image(),
        ),
        title: faker.lorem.sentence(),
        createdAt: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commentsCount: faker.randomGenerator.integer(10000),
        shareCount: faker.randomGenerator.integer(100),
        currentUserReaction: ReactionType
            .values[faker.randomGenerator.integer(ReactionType.values.length)],
      );
      publications.add(publication);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        leadingWidth: 150,
        leading: SvgPicture.asset(
          'assets/logo/facebook.svg',
          color: Colors.blueAccent,
          height: 200,
          width: 150,
        ),
        actions: const [
          CircleButton(color: Colors.grey, icon: CustomIcons.search),
          CircleButton(
              color: Color(0xfff8756d), icon: CustomIcons.bell, showBadage: true),
          CircleButton(color: Color(0xff7eb4fc), icon: CustomIcons.userFriends),
          CircleButton(color: Color(0xff1c89db), icon: CustomIcons.messenger),
        ],
      ),
      body: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: WhatIsOnYourMind(
              user: 'assets/users/2.jpg',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuickActions(),
          ),
          const UserStories(),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemBuilder: (_, index) {
              final publication = publications[index];
              return PublicationItem(publication: publication,);
              },
            physics: const NeverScrollableScrollPhysics(),
            itemCount: publications.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
