import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  void Function()? onTap;
  final String buttonTitle;
  CustomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF10b981),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 0.4,
                color: Colors.black87,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonTitle,
                style: const TextStyle(
                    fontSize: 15, color: Colors.white, letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
