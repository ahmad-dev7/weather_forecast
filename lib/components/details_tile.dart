import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsTile extends StatelessWidget {
  final String heading, info, imagePath;
  const DetailsTile({
    super.key,
    required this.heading,
    required this.info,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Image.asset(imagePath, height: 35),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                info,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
