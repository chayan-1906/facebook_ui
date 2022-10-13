import 'package:facebook_ui/models/user_model.dart';
import 'package:facebook_ui/widgets/circle_button.dart';
import 'package:facebook_ui/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import 'user_card.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key key,
    this.currentUser,
    this.icons,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                letterSpacing: -1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(currentUser: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  iconData: Icons.search_rounded,
                  iconSize: 30.0,
                  onPressed: () {
                    print('Search');
                  },
                ),
                CircleButton(
                  iconData: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () {
                    print('facebook messenger');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
