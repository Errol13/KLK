import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatefulWidget {
  final int likes;
  final bool isLiked;
  final VoidCallback onTap;

  const LikeButtonWidget({
    required this.likes,
    required this.isLiked,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: LikeButton(
        size: 35,
        isLiked: widget.isLiked,
        onTap: (isLiked) {
          widget.onTap();
          return Future.value(!isLiked);
        },
      ),
    );
  }
}
