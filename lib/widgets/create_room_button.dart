import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print('Create Room');
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Colors.white,
        side: BorderSide(width: 3.0, color: Colors.blueAccent.shade100),
        textStyle: const TextStyle(color: Palette.facebookBlue),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return Palette.createRoomGradient.createShader(rect);
            },
            child: const Icon(
              Icons.video_call_rounded,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text('Create \n Room'),
        ],
      ),
    );
  }
}
