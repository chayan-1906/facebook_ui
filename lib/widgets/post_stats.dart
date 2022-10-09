import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post_model.dart';
import 'post_button.dart';

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up_rounded,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            /// like
            PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey.shade600,
                size: 20.0,
              ),
              label: 'Like',
              onTap: () {
                print('Like');
              },
            ),

            /// comment
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey.shade600,
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () {
                print('Comment');
              },
            ),

            /// share
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey.shade600,
                size: 25.0,
              ),
              label: 'Share',
              onTap: () {
                print('Share');
              },
            ),
          ],
        ),
      ],
    );
  }
}
