import 'package:flutter/material.dart';
import 'package:gursha/presentation/util/colors.dart';
import 'package:gursha/presentation/widgets/small_heading.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final double size;
  final double textHeight;
  const ExpandableText(
      {Key? key,
      required this.text,
      required this.size,
      required this.textHeight})
      : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstPart;
  late String secondPart;
  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.textHeight) {
      firstPart = widget.text.substring(0, widget.textHeight.toInt());
      secondPart = widget.text
          .substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstPart = widget.text;
      secondPart = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondPart.isEmpty
          ? SmallHeadingText(
              text: firstPart,
            )
          : Column(
              children: [
                SmallHeadingText(
                    overflow: TextOverflow.visible,
                    size: widget.size,
                    color: AppColors.paraColor,
                    height: 1.8,
                    text: hiddenText
                        ? ('$firstPart ...')
                        : (firstPart + secondPart)),
                InkWell(
                  onTap: () => setState(() {
                    hiddenText = !hiddenText;
                  }),
                  child: Row(children: [
                    SmallHeadingText(
                      text: 'show ${hiddenText ? 'more' : 'less'}',
                      color: AppColors.mainColor,
                    ),
                    Icon(
                      hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.mainColor,
                    )
                  ]),
                )
              ],
            ),
    );
  }
}
