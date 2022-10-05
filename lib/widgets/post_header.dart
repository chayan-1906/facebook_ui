import 'dart:ui';

import 'package:facebook_ui/models/post_model.dart';
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public_rounded,
                    color: Colors.grey.shade600,
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            print('More');
          },
          icon: const Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }
}
