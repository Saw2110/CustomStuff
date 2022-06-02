import 'package:flutter/material.dart';

class AutoScrollableText extends StatelessWidget {
  final String scrollableText;

  final ScrollController _scrollController = ScrollController();

  AutoScrollableText({Key? key, required this.scrollableText})
      : super(key: key);
  _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 5),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Text(scrollableText, textAlign: TextAlign.justify),
    );
  }
}
