import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/models/post_model.dart';
import 'package:facebook_ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/create_post_container.dart';
import '../widgets/post_container.dart';
import '../widgets/rooms.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
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
