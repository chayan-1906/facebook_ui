import 'package:facebook_ui/models/user_model.dart';
import 'package:facebook_ui/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User> onlineUsers;

  const ContactList({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.search_rounded, color: Colors.grey.shade600),
              const SizedBox(width: 8.0),
              Icon(Icons.more_horiz_rounded, color: Colors.grey.shade600),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: onlineUsers.length,
              itemBuilder: (BuildContext context, int index) {
                final User currentUser = onlineUsers[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(currentUser: currentUser),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
