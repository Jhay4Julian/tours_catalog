import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  const ReadMoreText({super.key, required this.text});

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  late String firstHalf;
  late String secondHalf;

  bool isShort = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              children: [
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  isShort ? (firstHalf + " . . .") : (firstHalf + secondHalf),
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        isShort ? "Show More" : "Show Less",
                        style: const TextStyle(
                            color: Color(0xFF10b981),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      isShort = !isShort;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
