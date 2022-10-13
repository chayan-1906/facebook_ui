import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/screens/home_screen.dart';
import 'package:facebook_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.ondemand_video_rounded,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu_rounded,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
