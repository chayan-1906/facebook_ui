import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'create_room_button.dart';
import 'responsive.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        // color: Colors.orange,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: onlineUsers.length + 1,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true),
            );
          },
        ),
      ),
    );
  }
}
