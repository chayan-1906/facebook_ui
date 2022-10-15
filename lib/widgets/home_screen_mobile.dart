import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/post_model.dart';
import 'circle_button.dart';
import 'create_post_container.dart';
import 'post_container.dart';
import 'rooms.dart';
import 'stories.dart';

class HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const HomeScreenMobile({
    Key key,
    @required this.trackingScrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: trackingScrollController,
        slivers: [
          SliverAppBar(
            // brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: true,
            floating: true,
            actions: [
              /// search icon
              CircleButton(
                iconData: Icons.search_rounded,
                iconSize: 30.0,
                onPressed: () {
                  print('search');
                },
              ),

              /// search icon
              CircleButton(
                iconData: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () {
                  print('messenger');
                },
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
