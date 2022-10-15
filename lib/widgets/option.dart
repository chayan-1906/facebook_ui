import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String label;

  const Option({
    Key key,
    @required this.iconData,
    @required this.color,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(label);
      },
      child: Row(
        children: [
          Icon(iconData, size: 30.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
